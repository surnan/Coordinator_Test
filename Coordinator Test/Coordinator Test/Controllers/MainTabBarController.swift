//
//  MainTabBarController.swift
//  Coordinator Test
//
//  Created by admin on 7/14/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MainCoordinator: BaseCoordinator {
    var navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

class MainTabBarController: UITabBarController {
    let main = MainCoordinator(navigationController: UINavigationController())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main.start()
        viewControllers = [main.navigationController]
    }
    
    
}
