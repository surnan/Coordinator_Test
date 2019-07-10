//
//  ViewController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    //weak var coordinator: ShowTabControllerCoordinator?
    weak var coordinator: ViewControllerCoordinator?
    
    @IBAction func buyTapped(_ sender: Any) {
//        coordinator?.buySubscription()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
//        coordinator?.createAccount()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

