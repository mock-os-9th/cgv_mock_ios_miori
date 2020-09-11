//
//  LInputViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class LInputViewController: UIViewController {
    
    @IBOutlet weak var uidTextField: UITextField!
    @IBOutlet weak var upwTextField: UITextField!
    
    @IBOutlet weak var btn_box: UIButton!
    
    @IBAction func pressGetSignUpResult(_ sender: UIButton) {
        let uid = uidTextField.text!
        let upw = upwTextField.text!
        let userInfo = LoginModel(id: uid, pw: upw)
        SignInDataManager().getLogin(userInfo, self)
        print("new : \(userInfo.uid)")
        //self.dismiss(animated: false, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 딴 곳 누르면 키보드 들어가게 하기 (템플릿 이용)
        self.hideKeyboardWhenTappedAround()
        let width = self.view.frame.width
        
        
        
        let navigationBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y:35
            , width: width, height: 44))
        self.view.addSubview(navigationBar);
        //let navigationItem = UINavigationItem(title: "Navigation bar")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "< 로그인", style: .plain, target: self, action: #selector(backAction))
        //navigationBar.tintColor = .black
        
        
        //틴트는 검정색
        navigationItem.leftBarButtonItem?.tintColor = .black
        //배경은 흰색
        navigationBar.barTintColor = .white
        //라인 지우기
        navigationBar.shadowImage = UIImage()
        
        
        
        navigationBar.setItems([navigationItem], animated: false)
        
        
        // Do any additional setup if required.
        // textfield border 아래
        let border = CALayer()
        let twidth = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: uidTextField.frame.size.height - twidth, width:  uidTextField.frame.size.width, height: uidTextField.frame.size.height)
        
        border.borderWidth = twidth
        uidTextField.layer.addSublayer(border)
        uidTextField.layer.masksToBounds = true
        
        // textfield border 아래
        let border2 = CALayer()
        let twidth2 = CGFloat(1.0)
        border2.borderColor = UIColor.darkGray.cgColor
        border2.frame = CGRect(x: 0, y: upwTextField.frame.size.height - twidth2, width:  upwTextField.frame.size.width, height: upwTextField.frame.size.height)
        
        border2.borderWidth = twidth2
        upwTextField.layer.addSublayer(border2)
        upwTextField.layer.masksToBounds = true
        
        
    }
    
    @objc func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapSingUp(_ sender: UIButton) {
        let cj1View = UINavigationController(rootViewController:CJ1ViewController(nibName: "CJ1ViewController", bundle: nil))
        //navigation안에
        cj1View.modalPresentationStyle = .fullScreen
        self.present(cj1View, animated: false, completion: nil)
        //self.navigationController?.pushViewController(cj1View, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        btn_box.setBackgroundImage(UIImage(named: "noncheck1"), for: .normal)
        btn_box.setBackgroundImage(UIImage(named: "noncheck2"), for: .selected)

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
