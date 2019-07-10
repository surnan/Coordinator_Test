//
//  MyTabCoordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ShowTabControllerCoordinator: Coordinator {
    weak var parentCoordinators : SetupTabCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    let vc2 = SecondController()
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        
        //let vc2 = SecondController() //ERROR: viewControllers = [main.navigationController, main.vc2]
        
        vc2.coordinator = self
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)
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
