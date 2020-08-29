//
//  MainViewController.swift
//  ios
//
//  Created by Jerry Jung on 07/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func pressedGetTutorials(_ sender: UIButton) {
        MainDataManager().getTutorials(self)
    }
    
    @IBAction func pressedPresentPopUpView(_ sender: UIButton) {
        let noticePopUpStoryboard = UIStoryboard(name: "NoticePopUp", bundle: Bundle.main)
        guard let noticePopUp = noticePopUpStoryboard
            .instantiateViewController(withIdentifier: "NoticePopUp") as? NoticePopUp else {
            return
        }
        noticePopUp.noticePopUpDelegate = self
        noticePopUp.modalPresentationStyle = .custom
        // 기본 팝업 세팅 끝
        
        self.present(noticePopUp, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension MainViewController: NoticePopUpDelegate {    
    func pressedDismissButton() {
        self.titleLabel.text = "팝업 닫기 완료"
    }
    
    
}
