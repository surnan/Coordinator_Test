//
//  SellCoordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class SellCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func popBackwards(){
        navigationController.popViewController(animated: true)
    }
    
    
    func start(){
        let vc = SellController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
}
