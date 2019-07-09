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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start(){
        let vc = OpeningController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func pushToTabController(){
        let child = MainCoordinator(navigationController: navigationController)
        child.parentCoordinators = self
        childCoordinators.append(child)
        child.start()
    }
}

