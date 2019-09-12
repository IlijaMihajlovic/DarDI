//
//  MainTabController.swift
//  DarwinDigital
//
//  Created by Ilija Mihajlovic on 9/12/19.
//  Copyright © 2019 Ilija Mihajlovic. All rights reserved.
//

import UIKit


class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    
    fileprivate func setupControllers() {
        
        tabBar.unselectedItemTintColor = .gray
        tabBar.tintColor = .mainOrange
        
        let home = HomeController()
        let homeNavigationController = UINavigationController(rootViewController: home)
        homeNavigationController.tabBarItem.image = UIImage(named: "userList")?.withRenderingMode(.alwaysTemplate)
        homeNavigationController.tabBarItem.selectedImage = UIImage(named: "userList")?.withRenderingMode(.alwaysTemplate)
        
        let map = MapController()
        let mapNavigationController = UINavigationController(rootViewController: map)
        mapNavigationController.tabBarItem.image = UIImage(named: "map")?.withRenderingMode(.alwaysTemplate)
        mapNavigationController.tabBarItem.selectedImage = UIImage(named: "map")?.withRenderingMode(.alwaysTemplate)
        
        
        viewControllers = [homeNavigationController,mapNavigationController]
        
        guard let items = tabBar.items else { return }
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        }
    }
}
