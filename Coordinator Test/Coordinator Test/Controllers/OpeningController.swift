//
//  OpeningController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class OpeningController: UIViewController {
    weak var coordinator: FirstCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NEXT", style: .done, target: self, action: #selector(pushToNextVC))
    }
    
    @objc func pushToNextVC(){
        coordinator?.pushOpenVC_ToSetupTabCoordinator()
    }
}
