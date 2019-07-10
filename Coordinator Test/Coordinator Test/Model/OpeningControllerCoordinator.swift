//
//  _MainCoordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class OpeningControllerCoordinator: NSObject, UINavigationControllerDelegate, Coordinator {
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
        let child = AnotherTabController()
        child.parentCoordinators = self
        navigationController.pushViewController(child, animated: true)
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

