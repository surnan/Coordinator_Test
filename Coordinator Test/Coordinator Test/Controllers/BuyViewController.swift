//
//  BuyViewController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    weak var coordinator: FirstControllerCoordinator?
    
    var myButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("BACK BUTTON", for: .normal)
        button.addTarget(self, action: #selector(handleMyButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func handleMyButton(){
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "JIJIJ", style: .done, target: self, action: #selector(handleBack))
        view.addSubview(myButton)
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        print("First Controller Triggered")
    }
    
    @objc func handleBack(){
        navigationController?.popViewController(animated: true)
    }
}
