//
//  ViewControllerCoordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

//func start(){
//    navigationController.delegate = self
//    let vc = OpeningController()
//    vc.coordinator = self
//    navigationController.pushViewController(vc, animated: false)
//}

import UIKit

class FirstControllerCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = FirstController.instantiate()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubscription(){
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func createAccount(){
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}

