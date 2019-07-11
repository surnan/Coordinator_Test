//
//  BuyViewController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//
import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func handleBack(){
        navigationController.popViewController(animated: true)
    }
    
    func handleForward(){
        let child = FinalCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func start() {
        let vc = BuyViewController()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        navigationController.pushViewController(vc, animated: false)
    }
}

class BuyViewController: UIViewController{
    weak var coordinator: BuyCoordinator?

    enum ButtonTags: Int {case back = 0, forward, navigationBack}

    var myButton = GenericButton(title: "Coord.handleBack", tab: ButtonTags.back.rawValue)
    var myButton2 = GenericButton(title: "navigationController?.popViewController", tab: ButtonTags.navigationBack.rawValue)
    var myButton3 = GenericButton(title: "FORWARD", tab: ButtonTags.forward.rawValue)
    
        @objc func handleAllButton(sender: UIButton){
            switch sender.tag {
            case ButtonTags.back.rawValue           : coordinator?.handleBack()
            case ButtonTags.forward.rawValue        : coordinator?.handleForward()
            case ButtonTags.navigationBack.rawValue : navigationController?.popViewController(animated: true)
            default                                 :print("error")
            }
        }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("BUY ViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myButton)
        view.addSubview(myButton2)
        view.addSubview(myButton3)
        [myButton, myButton2, myButton3].forEach{
            view.addSubview($0)
            $0.addTarget(self, action: #selector(handleAllButton(sender:)), for: .touchUpInside)
        }
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            myButton2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton2.topAnchor.constraint(equalTo: myButton.bottomAnchor, constant: 20),
            myButton3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton3.topAnchor.constraint(equalTo: myButton2.bottomAnchor, constant: 20)
            ])
    }
}
