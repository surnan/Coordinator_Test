//
//  ViewController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//
import UIKit

class FirstCoordinator: Coordinator {
    weak var parentCoordinator      : Coordinator?
    var navigationController        : UINavigationController
    var childCoordinators           = [Coordinator]()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = FirstController()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        navigationController.pushViewController(vc, animated: false)
    }
    
    
    //MARK:- Handlers
    func handleBuy(){
        let child =  BuyCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
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
    enum ButtonTags: Int {case buy = 0, create}

    var buyButton = GenericButton(title: "BUY", tab: ButtonTags.buy.rawValue)
    var createButton = GenericButton(title: "CREATE", tab: ButtonTags.create.rawValue)
    
    @objc func handleBuyButton(sender: UIButton){
        switch sender.tag {
        case ButtonTags.buy.rawValue:
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
            $0.addTarget(self, action: #selector(handleBuyButton(sender:)), for: .touchUpInside)
            view.addSubview($0)
        }
        
        let safe = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            buyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buyButton.topAnchor.constraint(equalTo: safe.topAnchor, constant: 30),
            createButton.topAnchor.constraint(equalTo: buyButton.bottomAnchor, constant: 30),
            ])
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

