//
//  LogInViewController.swift
//  ios
//
//  Created by miori Lee on 2020/08/30.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class LogInMenuViewController: UIViewController {
    
    @IBOutlet weak var fixTopView: UIView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var secondTopView: UIView!
    @IBOutlet weak var loginFiled: UIView!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var detailInfo: UIStackView!
    
    //영화별 예매, 극장별 예매, 패스트오더, 포퇴켓 버튼 이벤트
    @IBOutlet weak var movieR: UIStackView!
    @IBOutlet weak var theaterR: UIStackView!
    @IBOutlet weak var fastO: UIStackView!
    @IBOutlet weak var photoT: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func pressLogin(_ sender: UIButton) {
        let loginput = LInputViewController(nibName: "LInputViewController", bundle: nil)
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
        
        //mainscrollview autolayout 지정
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        //위치지정  x위치
        mainScrollView.topAnchor.constraint(equalTo: fixTopView.bottomAnchor
            ,constant: 0).isActive = true // ---- 1
        
        mainScrollView.heightAnchor.constraint(equalToConstant: 795)
            .isActive = true // ---- 3
        mainScrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width)
            .isActive = true // ---- 4
        
        secondTopView.topAnchor.constraint(equalTo: fixTopView.bottomAnchor
            ,constant: 0).isActive = true // ---- 1
        
        //self.view.addSubview(self.loginFiled)
        
        //loginField autolayout 지정
        loginFiled.translatesAutoresizingMaskIntoConstraints = false
        loginFiled.topAnchor.constraint(equalTo: fixTopView.bottomAnchor
            ,constant: 0).isActive = true // ---- 1
        loginFiled.heightAnchor.constraint(equalToConstant: 140)
            .isActive = true // ---- 3
        loginFiled.heightAnchor.constraint(equalToConstant: 325)
            .isActive = true // ---- 3
        
        
        //버튼 클릭 가능하게 서브뷰를 맨앞으로 빼줘
        //안해줬더니 버튼이 클릭이 안됨.
        mainScrollView.bringSubviewToFront(secondTopView)
        secondTopView.bringSubviewToFront(loginFiled)
        secondTopView.bringSubviewToFront(detailInfo)
        
        
        //uiVIew 를 터치했을 때 이벤트 생성
        let singleTapGesture : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        //한번 누르게 할거야
        singleTapGesture.numberOfTouchesRequired = 1
        self.movieR.addGestureRecognizer(singleTapGesture)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func singleTap() {
        print("hello")
    }
    
}




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


