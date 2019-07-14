//
//  _Setup.swift
//  Coordinator Test
//
//  Created by admin on 7/13/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {   //   !==
    var childCoordinators: [Coordinator] {get set}
    func start()
}

extension Coordinator {     //Extension is only way to get code into function
    func store(coordinator: Coordinator){childCoordinators.append(coordinator)}
    func free(coordinator: Coordinator) {childCoordinators = childCoordinators.filter{$0 !== coordinator}} //Anyobject
}

class BaseCoordinator: Coordinator {
    var childCoordinators:  [Coordinator] = []
    var isComplete: (()->())?       //replace last () with Void?
    func start(){fatalError("Children should implement 'start'")}
}

class AppCoordinator: BaseCoordinator {
    let window: UIWindow
    init(window: UIWindow){
        self.window = window
        super.init()
    }
    
    override func start() {
        let navController = UINavigationController()
        let openingCoord = OpeningCoordinator(navigationController: navController)
        self.store(coordinator: openingCoord)
        openingCoord.start()
        window.rootViewController = navController
        window.makeKeyAndVisible()
        openingCoord.isCompleted =  {[weak self] in
            self?.free(coordinator: openingCoord)
        }
    }
}
