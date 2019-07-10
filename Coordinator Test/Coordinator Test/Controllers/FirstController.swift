//
//  ViewController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class FirstController: UIViewController, Storyboarded {
    weak var coordinator: FirstControllerCoordinator?
    
    @IBAction func buyTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

