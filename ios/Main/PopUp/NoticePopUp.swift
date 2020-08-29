//
//  NoticePopUp.swift
//  ios
//
//  Created by Jerry Jung on 12/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class NoticePopUp: BaseViewController {
    var noticePopUpDelegate: NoticePopUpDelegate!
    
    @IBAction func pressedDismiss(_ sender: UIButton) {
        self.noticePopUpDelegate.pressedDismissButton()
        self.dismiss(animated: false, completion: nil)
    }
}
