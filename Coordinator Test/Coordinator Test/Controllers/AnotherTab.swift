//
//  AnotherTabController.swift
//  Coordinator Test
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AnotherTabCoordinator: BaseCoordinator {
    weak var parentCoordinator      : Coordinator?
    var navigationController        : UINavigationController
    
    var firstCoordinator            = FirstCoordinator(navigationController: UINavigationController())
    var secondCoordinator           = SecondCoordinator(navigationController: UINavigationController())
    
    init(navigationController: UINavigationController) {
        self.navigationController   = navigationController
    }
    
    override func start() {
        firstCoordinator.parentCoordinator  = self
        secondCoordinator.parentCoordinator = self
        
        childCoordinators.append(firstCoordinator)
        childCoordinators.append(secondCoordinator)
        
        
        let vc              = AnotherTabController()
        vc.coordinator      = self
        vc.coordinatorOne   = firstCoordinator.start
        vc.coordinatorTwo   = secondCoordinator.start
        vc.tabControllers   = [firstCoordinator.navigationController, secondCoordinator.navigationController]
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator){
        //Child Coordinator is returned to parent
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

class AnotherTabController: UITabBarController{
    var coordinator             : AnotherTabCoordinator?
    var coordinatorOne          : (()-> Void)?
    var coordinatorTwo          : (()-> Void)?
    var tabControllers          : [UIViewController]?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        coordinatorOne?()
        coordinatorTwo?()
        viewControllers = tabControllers
        print("AnotherTAB ViewController")
    }
}

