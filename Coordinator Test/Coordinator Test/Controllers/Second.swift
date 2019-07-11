//
//  SecondController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

//func start(){
//    weak var parentCoordinator      : Coordinator?
//    navigationController.delegate = self
//    let vc = OpeningController()
//    vc.coordinator = self
//    navigationController.pushViewController(vc, animated: false)
//}

//func pushOpenVC_ToSetupTabCoordinator(){
//    let child = AnotherTabCoordinator(navigationController: navigationController)
//    child.parentCoordinator = self
//    childCoordinators.append(child)
//    child.start()
//}

import UIKit

class SecondCoordinator: Coordinator {
    weak var parentCoordinator      : Coordinator?
    var navigationController        : UINavigationController
    var childCoordinators           = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = SecondController()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        navigationController.pushViewController(vc, animated: false)
    }
}

class SecondController: UIViewController {
    weak var coordinator: SecondCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}