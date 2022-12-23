//
//  ViewController.swift
//  netlfix-clone
//
//  Created by Javokhir Savriev on 07/11/22.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vcHome = UINavigationController(rootViewController: HomeViewController())
        vcHome.title = "Home"
        vcHome.tabBarItem.image = UIImage(systemName: "house")

        let vcUpcoming = UINavigationController(rootViewController: UpcomingViewController())
        vcUpcoming.title = "Coming soon"
        vcUpcoming.tabBarItem.image = UIImage(systemName: "play.circle")
        
        let vcSearch = UINavigationController(rootViewController: SearchViewController())
        vcSearch.title = "Top Searches"
        vcSearch.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        
        let vcDownloads = UINavigationController(rootViewController: DownloadsViewController())
        vcDownloads.title = "Downloads "
        vcDownloads.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
         
        setViewControllers([vcHome, vcUpcoming, vcSearch, vcDownloads], animated: true)
    }
}

