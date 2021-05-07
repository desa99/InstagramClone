//
//  TabBarViewController.swift
//  InstagramClone
//
//  Created by Desanka MIlakovic on 16.4.21..
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let home = HomeViewController()
        let explore = ExploreViewController()
        let camera = CameraViewController()
        let activity = NotificationViewController()
        let profile = ProfileViewController()
        
        let nav1 = UINavigationController(rootViewController: home)
        let nav2 = UINavigationController(rootViewController: explore)
        let nav3 = UINavigationController(rootViewController: camera)
        let nav4 = UINavigationController(rootViewController: activity)
        let nav5 = UINavigationController(rootViewController: profile)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Explore", image: UIImage(systemName: "safari"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Camera", image: UIImage(systemName: "camera"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Notification", image: UIImage(systemName: "bell"), tag: 4)
        nav5.tabBarItem = UITabBarItem(title: "Prifile", image: UIImage(systemName: "person.circle"), tag: 5)
        
        self.setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: true)


       
    }
    

  

}
