//
//  MainTabBarController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    weak var coordinator: SetupTabCoordinator?
    let main = ShowTabControllerCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        main.start()
        viewControllers = [main.navigationController, main.vc2]
    }
}
