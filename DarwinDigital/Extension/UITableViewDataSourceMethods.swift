//
//  UICollectionViewDataSource.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/11/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

//MARK: - UITableView Data Source Methods With a Custom Function

extension HomeController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return filterdArray.count
        
        } else {
            return incomingDataArray.count
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell
 
        if isSearching {
            searchBarIsSeraching(with: filterdArray, and: cell, atIndexPath: indexPath)
            
        } else {
            
            searchBarIsSeraching(with: incomingDataArray, and: cell, atIndexPath: indexPath)
        }
        
        return cell
    }
    

    
    //Custom Function
    func searchBarIsSeraching(with modelData: [JSONModelData], and cell: CustomCell, atIndexPath: IndexPath) {
        
        cell.address.text = modelData[atIndexPath.row].address.city
        cell.companyName.text = modelData[atIndexPath.row].company.name
        cell.username.text = modelData[atIndexPath.row].username
        
        if let imageURL = URL(string: modelData[atIndexPath.row].avatar) {
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
    }
  
}

