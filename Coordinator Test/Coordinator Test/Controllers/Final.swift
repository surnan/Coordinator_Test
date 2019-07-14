//
//  Final.swift
//  Coordinator Test
//
//  Created by admin on 7/11/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FinalCoordinator: BaseCoordinator {
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = FinalViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func handleButton2(){
        navigationController.popViewController(animated: true)
    }
}


class FinalViewController: UIViewController{
    weak var coordinator: FinalCoordinator?
    
    let backButton = GenericButton(title: "navigationController?.popViewController", tab: 0)
    let backButton2 = GenericButton(title: "coord.handleButton", tab: 1)
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("FINAL ViewController")
    }
    
    @objc func handleButton(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleButton2(){
        coordinator?.handleButton2()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        backButton2.addTarget(self, action: #selector(handleButton2), for: .touchUpInside)
        view.backgroundColor = .gray
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        backButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
