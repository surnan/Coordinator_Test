//
//  ViewController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//
import UIKit

class FirstCoordinator: BaseCoordinator {
    weak var parentCoordinator      : Coordinator?
    var navigationController        : UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let vc = FirstController()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        navigationController.pushViewController(vc, animated: false)
    }
    
    func handleBuy(){
        let childCoord =  BuyCoordinator(navigationController: navigationController)
        childCoord.parentCoordinator = self
        self.store(coordinator: childCoord)
        childCoord.start()
        childCoord.isComplete =  {[weak self] in
            self?.free(coordinator: childCoord)
        }
    }
    
    func handleCreate(){
        let child = CreateCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}


class FirstController: UIViewController{
    weak var coordinator: FirstCoordinator?
    enum ButtonTags: Int {case back = 0, create}

    var buyButton = GenericButton(title: "BUY", tab: ButtonTags.back.rawValue)
    var createButton = GenericButton(title: "CREATE", tab: ButtonTags.create.rawValue)
    
    @objc func handleAllButton(sender: UIButton){
        switch sender.tag {
        case ButtonTags.back.rawValue:
            coordinator?.handleBuy()
        case ButtonTags.create.rawValue:
            coordinator?.handleCreate()
        default:
            print("error")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        [buyButton, createButton].forEach{
            $0.addTarget(self, action: #selector(handleAllButton(sender:)), for: .touchUpInside)
            view.addSubview($0)
        }
        let safe = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buyButton.topAnchor.constraint(equalTo: safe.topAnchor, constant: 30),
            createButton.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 30),
            ])
        view.backgroundColor = .white
        print("FIRST ViewController")
    }
}

