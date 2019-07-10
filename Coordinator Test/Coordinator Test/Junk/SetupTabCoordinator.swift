//
//  MainCoordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class SetupTabCoordinator: Coordinator {
    weak var parentCoordinators : OpeningControllerCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(){
        let myTabController = MainTabBarController()
        navigationController.pushViewController(myTabController, animated: true)
    }
}
