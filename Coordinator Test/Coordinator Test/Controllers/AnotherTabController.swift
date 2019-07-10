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

