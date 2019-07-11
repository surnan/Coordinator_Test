//
//  CreateAccountViewController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

import UIKit

class CreateCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CreateViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
}


class CreateViewController: UIViewController{
    weak var coordinator: CreateCoordinator?
    
    let myLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.text = "CREATE ACCOUNT VC"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myLabel)
        view.backgroundColor = .gray
        myLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

