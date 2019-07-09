//
//  MainCoordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    weak var parentCoordinators : _MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    let vc2 = SecondController()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(){
        let myTabController = MainTabBarController()
        navigationController.pushViewController(myTabController, animated: true)
    }
}
