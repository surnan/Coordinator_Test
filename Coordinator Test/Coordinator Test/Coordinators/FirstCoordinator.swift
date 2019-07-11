//
//  FirstControllerCoordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/10/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FirstCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(nav: UINavigationController){
        self.navigationController = nav
    }
    
    
    func start() {
        print("")
    }
}
