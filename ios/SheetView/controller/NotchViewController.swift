//
//  NotchViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Foundation

class NotchViewController: UIViewController {
    
    //handle view (위에 떠다니는 bar)
    var handleView:UIView = {
        var handleView = UIView()
        handleView.backgroundColor = UIColor.gray
        handleView.translatesAutoresizingMaskIntoConstraints = false
        handleView.layer.cornerRadius = 4.0
        return handleView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view는 투명하게
        self.view.backgroundColor = UIColor.clear
        self.view.addSubview(handleView)
        
        //view의 위치지정
        NSLayoutConstraint.activate([
            self.handleView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.handleView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.handleView.heightAnchor.constraint(equalToConstant: 5),
            self.handleView.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

