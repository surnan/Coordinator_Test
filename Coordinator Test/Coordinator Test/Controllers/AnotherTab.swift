//
//  AnotherTabController.swift
//  Coordinator Test
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AnotherTabCoordinator: Coordinator {
    weak var parentCoordinator      : Coordinator?
    var navigationController        : UINavigationController
    var childCoordinators           = [Coordinator]()
    
    var firstCoordinator            = FirstCoordinator(navigationController: UINavigationController())
    var secondCoordinator           = SecondCoordinator(navigationController: UINavigationController())
    
    init(navigationController: UINavigationController) {
        self.navigationController   = navigationController
    }
    
    func start() {
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

