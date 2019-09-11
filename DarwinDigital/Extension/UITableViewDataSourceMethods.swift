//
//  UICollectionViewDataSource.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/11/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

//MARK: - UITableView Data Source Methods

extension HomeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return incomingDataArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell
        
        let incomingJSONData = incomingDataArray[indexPath.row]
        
        cell.address.text = incomingJSONData.address.city
        cell.companyName.text = incomingJSONData.company.name
        cell.username.text = incomingJSONData.username
        
        if let imageURL = URL(string: incomingJSONData.avatar) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.avatar.image = image
                    }
                }
            }
        }
        
        return cell
    }
}

