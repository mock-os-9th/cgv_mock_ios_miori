//
//  SignUpSuccessPopUp.swift
//  ios
//
//  Created by miori Lee on 2020/09/15.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SignUpSuccessPopUp: BaseViewController {
    var signUpSuccessPopUpDelegate: SignUpSuccessPopUpDelegate!
    
    @IBAction func pressedDismiss(_ sender: UIButton) {
        self.signUpSuccessPopUpDelegate.pressedDismissButton()
        self.dismiss(animated: false, completion: nil)
    }
}
