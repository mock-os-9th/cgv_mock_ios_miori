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


    @IBOutlet weak var reserMovie: UIStackView!
    @IBOutlet weak var nameBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //옵셔널 바인딩
        if let jwt = UserDefaults.standard.string(forKey: "x-access-token") {
             let tokenModel = TokenModel(token: jwt)
            GetUserNameDataManager().getPosterImage(tokenModel, self)
        } else {
            let tokenModel = TokenModel(token: "")
            GetUserNameDataManager().getPosterImage(tokenModel, self)
        }
        
        
        
    }
    
    // x버튼 누르면 닫히게 하는 함수
    @IBAction func didTapClose(_ sender: UIButton) {
        self.dismiss(animated: false, completion: nil)
    }
    
    // 로그인 화면 띄어주는 함수
    @IBAction func pressLogin(_ sender: UIButton) {
        let loginput = LInputViewController()
        //full screen으로
        loginput.modalPresentationStyle = .fullScreen
        // self.present(loginput, animated: false, completion: nil)
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
        self.reserMovie.addGestureRecognizer(singleTapGesture)
    }
    
    @objc func movieRTap() {
        print("영화별예매눌림")
        
        //let loginput = LInputViewController()
        let theaherR = TopTapViewController()
        //full screen으로
        theaherR.modalPresentationStyle = .fullScreen
        // self.present(loginput, animated: false, completion: nil)
        // currentVC => FirstViewController
        guard let pvc = self.presentingViewController else { return }
        
        self.dismiss(animated: false) {
            pvc.present(theaherR, animated: true, completion: nil)
        }
    
    }
    
}


