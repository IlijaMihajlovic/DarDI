//
//  UICollectionViewDelegateMethods.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/11/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

extension HomeController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = DetailVC()
       detailVC.addAtrributedText(from: tableView, inviewController: detailVC)
 
            self.navigationController?.pushViewController(detailVC, animated: true)
  
    }

}



