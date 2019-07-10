//
//  _MainCoordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FirstCoordinator: NSObject, UINavigationControllerDelegate, Coordinator {
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
    
    func pushToTabController(){
        let child = SetupTabCoordinator(navigationController: navigationController)
        child.parentCoordinators = self
        childCoordinators.append(child)
        child.start()
    }
    
    
    //Child Coordinator is done/complete/returned-to-parent
    func childDidFinish(_ child: Coordinator){
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
        //YES = PUSH, NO = POP
        //NavigationDelegate won't trigger for Present(vc, aniimated: true)
        
        if navigationController.viewControllers.contains(fromVC) {
            //Event = Push
            return
        }
        
        /*
        //Event = Pop
        if let buyViewController = fromVC as? BuyViewController{
            childDidFinish(buyViewController.coordinator) //Verify VC to kill appropriate Coordinator
        }
        */
        
        
        
        
    }
    
}

