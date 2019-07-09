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
    
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.didFinishBuying()
        /*
         didFinishBuying can be used to synchronize data or refresh UI.
         It can be handled by MainCoordinator or BuyCoordinator
         */
    }
    
    
    
    
}
