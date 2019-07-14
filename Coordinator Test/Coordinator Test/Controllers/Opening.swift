//
//  OpeningController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class OpeningCoordinator: BaseCoordinator  {
    var navigationController: UINavigationController
    
    var isCompleted: (()->())?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    override func start(){
        let vc = OpeningController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }

    
    func handleNextBarButton(){
        let child = AnotherTabCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    
    
    /*
    //SECOND COORDINATOR
    func handleNextBarButton(){
        let childCoord = SecondCoordinator(navigationController: navigationController)
        childCoord.parentCoordinator = self
        self.store(coordinator: childCoord)
        childCoord.start()
        childCoord.isComplete =  {[weak self] in
            self?.free(coordinator: childCoord)
        }
    }
    */
    /*
    //FIRST COORDINATOR
    func handleNextBarButton(){
        let childCoord = FirstCoordinator(navigationController: navigationController)
        childCoord.parentCoordinator = self
        self.store(coordinator: childCoord)
        childCoord.start()
        childCoord.isComplete =  {[weak self] in
            self?.free(coordinator: childCoord)
        }
    }
    */
    
    
    
    func childDidFinish(_ child: Coordinator){
        //Child Coordinator is done/complete/returned-to-parent
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}

class OpeningController: UIViewController {
    weak var coordinator: OpeningCoordinator?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NEXT", style: .done, target: self, action: #selector(nextBarButton))
    }
    
    @objc func nextBarButton(){
        coordinator?.handleNextBarButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("OPENING ViewController")
    }
}


//func handleNext(){
//    let child = AnotherTabCoordinator(navigationController: navigationController)
//    child.parentCoordinator = self
//    childCoordinators.append(child)
//    child.start()
//
//    //        let child = FirstCoordinator(navigationController: navigationController)
//    //        child.parentCoordinator = self
//    //        child.start()
//}

//func handleNext(){
//    let child = AnotherTabCoordinator(navigationController: navigationController)
//    child.parentCoordinator = self
//    childCoordinators.append(child)
//    child.start()
//}
