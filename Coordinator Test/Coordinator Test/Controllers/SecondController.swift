//
//  SecondController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class SecondControllerCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
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
    weak var coordinator: SecondControllerCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
