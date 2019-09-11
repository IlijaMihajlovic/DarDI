//
//  ViewController.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/11/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    var incomingDataArray: [JSONData] = []
    let cellId = "cellId"
   
    //let searchBar = UISearchBar()
    var filterdArray  = [JSONData]()
    var isSearching = false
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        return searchBar
    }()
    
    lazy var sortBarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sort", for: .normal)
        button.addTarget(self, action: #selector(sortTableViewbyUsername), for: .touchUpInside)
        button.frame = CGRect(x: 1, y: 0, width: 35, height: 35)
        return button
    }()
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        showSearchBarButtonItem(shouldShow: true)
        addBarrButtonItem()
        
        getJSONData()
  }
    
    @objc func sortTableViewbyUsername() {
        incomingDataArray.sort { $0.username < $1.username } // sort ascending by username
        tableView.reloadData()
    }
    
    fileprivate func addBarrButtonItem() {
       navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sortBarButton)
    }
    
    @objc func handleShowSearch() {
        showSearchBar(shouldShow: true)
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
    }
 
    
    func showSearchBarButtonItem(shouldShow: Bool) {
        
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearch))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func showSearchBar(shouldShow: Bool) {
        
        //If the search bar is shown then disable the bar button item(the opposite of the argument shouldShow)
        showSearchBarButtonItem(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar: nil
    }
    
    fileprivate func setupTableView() {
        tableView.backgroundColor = .orange
        tableView.separatorStyle = .none  // Remove the seperator lines from the tableView
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
    }
    
    
   
    
    func getJSONData() {
        //let url = "https://jsonplaceholder.typicode.com/posts"
        let url = "https://api.myjson.com/bins/w0b55"
        //let url = "https://my-json-server.typicode.com/IlijaMihajlovic/demo/blob/master/db.json"
        guard let urlString = URL(string: url) else { return }
        
        self.fetchJSON(url: urlString) {(result) in
            
            switch result {
            case .success(let jsonData):
                //print(jsonData.body, jsonData.id)
                jsonData.forEach({ (data) in
                    //print("Success: \(data.address), \(data.id)")
                })
                
                
            case .failure(let err):
                print("Failed:", err)
            }
            
        }
    }

    

    
}

