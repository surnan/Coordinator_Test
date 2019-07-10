//
//  AnotherTabController.swift
//  Coordinator Test
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class AnotherTabController: UITabBarController{
    weak var parentCoordinators : OpeningControllerCoordinator?
    lazy var viewControllerCoord = FirstControllerCoordinator(navigationController: UINavigationController())
    lazy var secondControllerCoord = SecondControllerCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllerCoord.start()
        secondControllerCoord.start()
        viewControllers = [viewControllerCoord.navigationController, secondControllerCoord.navigationController]
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //navigationController?.isNavigationBarHidden = true
    }
}

