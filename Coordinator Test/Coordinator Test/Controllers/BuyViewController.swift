//
//  BuyViewController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {
    weak var coordinator: BuyCoordinator?
    
    var myButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("--FORWARDS--", for: .normal)
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    @objc func handleButton(){
        coordinator?.pushForward()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myButton)
        
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            ])
        
    } 
}
