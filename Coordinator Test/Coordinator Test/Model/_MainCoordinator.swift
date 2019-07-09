//
//  _MainCoordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class _MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    let vc = OpeningController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(){
        navigationController.pushViewController(vc, animated: false)
    }
    
}
    
    
    
//    func start(){
//        let vc = ViewController.instantiate()
//        vc.coordinator = self
//        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
//
//        vc2.coordinator = self
//        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
//        navigationController.pushViewController(vc, animated: false)
//    }
//    func buySubscription(){
//        let vc = BuyViewController.instantiate()
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: true)
//    }
//
//    func createAccount(){
//        let vc = CreateAccountViewController.instantiate()
//        vc.coordinator = self
//        navigationController.pushViewController(vc, animated: true)
//    }
