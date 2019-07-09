//
//  OpeningController.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class OpeningController: UIViewController {
    weak var coordinator: _MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "NEXT", style: .done, target: self, action: #selector(pushToNextVC))
    }
    
    @objc func pushToNextVC(){
        //navigationController?.pushViewController(MainTabBarController(), animated: true)
        coordinator?.pushToTabController()
    }
}
