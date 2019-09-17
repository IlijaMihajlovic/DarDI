//
//  ViewController.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/11/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    static let shared = HomeController()
    
    //MARK: - Propeties
    var isSearching = false
    let cellId = "cellId"
    let url = "https://api.myjson.com/bins/w0b55" /* NOTE TO DarwinDigital iOS Developers: I posted the raw JSON data you folks did send me to a HTTP based JSON storage endpoint to simulete parsing the JSON data from a REST API */
    
    var incomingDataArray = [UserJSONData]()
    var filterdArray = [UserJSONData]()
    
    lazy fileprivate var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        return searchBar
    }()
    
    lazy fileprivate var sortBarButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sort", for: .normal)
        button.addTarget(self, action: #selector(sortTableViewbyUsername), for: .touchUpInside)
        button.frame = CGRect(x: 1, y: 0, width: 35, height: 35)
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        showSearchBarButtonItem(shouldShow: true)
        addBarrButtonItem()
        checkJSONDataForPossibleErrors()
        navigationItem.title = "Users"
  }
    
    private init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc fileprivate func goToMapController() {
        let mapVC = MapController()
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    
    
    //MARK: - TableView
    fileprivate func setupTableView() {
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
    }
    
    //MARK: - Search Bar Button Function
    @objc fileprivate func handleShowSearchBar() {
        showSearchBar(shouldShow: true)
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
    }
    
    fileprivate func showSearchBarButtonItem(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(handleShowSearchBar))
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
    
    
    //MARK: - Sort Button Functions
    fileprivate func addBarrButtonItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sortBarButton)
    }
    
    @objc fileprivate func sortTableViewbyUsername() {
        incomingDataArray.sort { $0.username < $1.username } //sort username by ascending order
        tableView.reloadData()
    }
    

    //MARK: - Check JSON Data For Possible Errors
   fileprivate func checkJSONDataForPossibleErrors() {
        guard let urlString = URL(string: url) else { return }
        
        self.fetchJSON(url: urlString) {(result) in
            
            switch result {
            case .success(let jsonData):
                jsonData.forEach({ (data) in
                    //print("Success: \(data.address), \(data.id)")
                })
                
            case .failure(let err):
                print("Failed:", err)
            }
        }
    }
    
 
    
}

