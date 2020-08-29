//
//  BaseViewController.swift
//  ios
//
//  Created by Jerry Jung on 06/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: 인디케이터 표시
    func showIndicator() {
        CustomIndicatorView.shared.show()
    }
    
    // MARK: 인디케이터 숨김
    func dismissIndicator() {
        CustomIndicatorView.shared.dismiss()
    }
}
