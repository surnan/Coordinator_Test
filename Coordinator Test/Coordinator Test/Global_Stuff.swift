//
//  Coordinator.swift
//  Coordinator Test
//
//  Created by admin on 7/9/19.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


func GenericButton(title: String, tab: Int)->UIButton{
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.backgroundColor = .blue
    button.setTitleColor(.white, for: .normal)
    button.tag = tab
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
}
