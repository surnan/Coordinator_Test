//
//  OpeningController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class OpeningCoordinator: NSObject, UINavigationControllerDelegate, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(){
        navigationController.delegate = self
        let vc = OpeningController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func pushOpenVC_ToSetupTabCoordinator(){
        let child = AnotherTabCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish(_ child: Coordinator){
        //Child Coordinator is done/complete/returned-to-parent
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    //MARK:- UINavigationControllerDelegate
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else {return}
        //Checking if ViewController Array already contains from 'fromVC'
        //YES = PUSH, NO = POP ... NavigationDelegate won't trigger for Present(vc, aniimated: true)
        if navigationController.viewControllers.contains(fromVC) {
            return      //Event = Push
        }
    }
}

class OpeningController: UIViewController {
    weak var coordinator: OpeningCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NEXT", style: .done, target: self, action: #selector(pushToNextVC))
    }
    
    @objc func pushToNextVC(){
        coordinator?.pushOpenVC_ToSetupTabCoordinator()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("OPENING ViewController")
    }
}

