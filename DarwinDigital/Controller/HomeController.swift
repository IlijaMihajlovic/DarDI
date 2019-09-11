//
//  ViewController.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/11/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    let testsArray = ["number 1","number 2","number 3","number 4","number 5","number 6",]
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        
        
        getJSONData()
  }
    
    fileprivate func setupTableView() {
        tableView.backgroundColor = .orange
        tableView.separatorStyle = .none  // Remove the seperator lines from the tableView
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
    }
    
    
    func getJSONData() {
        let url = "https://api.myjson.com/bins/w0b55"
        //let url = "https://my-json-server.typicode.com/IlijaMihajlovic/demo/blob/master/db.json"
        guard let urlString = URL(string: url) else { return }
        
        self.fetchJSON(url: urlString) {(result) in
            
            switch result {
            case .success(let jsonData):
                print(jsonData.address, jsonData.company)
                
                
            case .failure(let err):
                print("Failed", err)
            }
            
        }
    }

    

    
}

