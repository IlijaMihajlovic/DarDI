//
//  Networking.swift
//  Check24
//
//  Created by Ilija Mihajlovic on 8/19/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import Foundation

extension HomeController {
    
    // MARK - Fetch JSON Data
    func fetchJSON(url: URL, completion: @escaping (Result<[JSONData], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            guard let jsonData = data, let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 || httpResponse.statusCode == 200, error == nil else {
                
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    
                    completion(.failure(.domainError))
                    completion(.failure(.responseError))
                }
                return
            }
            
            //MARK: - Get Data Back
            do {
                let data = try JSONDecoder().decode([JSONData].self, from: jsonData)
                self.incomingDataArray = data
                
                completion(.success(data))
                //print(data)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                completion(.failure(.decodingError))
            }
            } .resume()
    }
}

