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
    
//    var firstCoordinator            = FirstControllerCoordinator(navigationController: UINavigationController())
//    var secondCoordinator           = SecondControllerCoordinator(navigationController: UINavigationController())
    
    
    var firstCoordinator : FirstControllerCoordinator
    var secondCoordinator : SecondControllerCoordinator
    
    
    
    
    
    init(navigationController: UINavigationController) {
        self.navigationController   = navigationController
//        firstCoordinator            = FirstControllerCoordinator(navigationController: UINavigationController())
//        secondCoordinator           = SecondControllerCoordinator(navigationController: UINavigationController())
        
        
        firstCoordinator            = FirstControllerCoordinator(navigationController: navigationController)
        secondCoordinator           = SecondControllerCoordinator(navigationController: navigationController)
        
    }

    func start() {
        let vc = AnotherTabController()
        vc.coordinatorOne   = firstCoordinator.start
        vc.coordinatorTwo   = secondCoordinator.start
        vc.tabControllers   = [firstCoordinator.navigationController, secondCoordinator.navigationController]
        navigationController.pushViewController(vc, animated: true)
    }
}

