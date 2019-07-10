//
//  AnotherTabController.swift
//  Coordinator Test
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class AnotherTabController: UITabBarController{
    weak var parentCoordinators : FirstCoordinator?
    lazy var viewControllerCoord = ViewControllerCoordinator(navigationController: UINavigationController())
    lazy var secondControllerCoord = SecondControllerCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerCoord.start()
        secondControllerCoord.start()
        viewControllers = [viewControllerCoord.navigationController, secondControllerCoord.navigationController]
    }
}

