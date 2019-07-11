//
//  ViewController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FirstController: UIViewController{
    weak var coordinator: FirstControllerCoordinator?
    
    
    enum ButtonTags: Int {
        case buy = 0, create
    }
    
    
    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
    
    
    lazy var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("BUY", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleBuyButton(sender:)), for: .touchUpInside)
        button.tag = ButtonTags.buy.rawValue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var createButton: UIButton = {
        let button = UIButton()
        button.setTitle("CREATE", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleBuyButton(sender:)), for: .touchUpInside)
        button.tag = ButtonTags.create.rawValue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleBuyButton(sender: UIButton){
        switch sender.tag {
        case ButtonTags.buy.rawValue:
            print("")
        case ButtonTags.create.rawValue:
            print("")
        default:
            print("error")
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        [buyButton, createButton].forEach{view.addSubview($0)}
        
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
    }
}

