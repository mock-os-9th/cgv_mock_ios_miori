//
//  LogInViewController.swift
//  ios
//
//  Created by miori Lee on 2020/08/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class LogInMenuViewController: UIViewController {
    
    
//    
//    //영화별 예매, 극장별 예매, 패스트오더, 포퇴켓 버튼 이벤트

    @IBOutlet weak var movieR: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapClose(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func pressLogin(_ sender: UIButton) {
        let loginput = LInputViewController()
        //        //full screen으로
        //
        loginput.modalPresentationStyle = .fullScreen
        //
        //        self.present(loginput, animated: false, completion: nil)
        // currentVC => FirstViewController
        guard let pvc = self.presentingViewController else { return }
        
        self.dismiss(animated: false) {
            pvc.present(loginput, animated: true, completion: nil)

        }
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)

        //uiVIew 를 터치했을 때 이벤트 생성
        let singleTapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(movieRTap))
        //한번 누르게 할거야
        singleTapGesture.numberOfTouchesRequired = 1
        self.movieR.addGestureRecognizer(singleTapGesture)
    }
    
    @objc func movieRTap() {
        print("영화별예매눌림")
        let theaherR = TopTapViewController()
        //full screen으로
        theaherR.modalPresentationStyle = .fullScreen
        self.present(theaherR, animated: false, completion: nil)
    }
    
}


