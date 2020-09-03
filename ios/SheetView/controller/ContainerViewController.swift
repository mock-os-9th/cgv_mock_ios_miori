//
//  ContainerViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Foundation

class ContainerViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.infoDark)
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(showTransparent(_:)), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.cornerRadius = 8.0
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            self.button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            self.button.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.button.widthAnchor.constraint(equalToConstant: 20),
            self.button.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
}

