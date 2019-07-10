//
//  AnotherTabCoordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AnotherTabCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    
    var viewControllerCoord = FirstControllerCoordinator(navigationController: UINavigationController())
    var secondControllerCoord = SecondControllerCoordinator(navigationController: UINavigationController())
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vc = AnotherTabController()
        vc.coordinator = self
        vc.firstCoord = viewControllerCoord.start
        vc.secondCoord = secondControllerCoord.start
        vc.temp = [viewControllerCoord.navigationController, secondControllerCoord.navigationController]
        navigationController.pushViewController(vc, animated: true)
    }
}
