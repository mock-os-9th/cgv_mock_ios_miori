//
//  CJ1ViewController.swift
//  ios
//
//  Created by miori Lee on 2020/09/01.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class CJ1ViewController: BaseViewController {
    
    var gender : String!
    // 이름
    @IBOutlet weak var userName: UITextField!
    
    // 성별 버튼 터치 이벤트
    @IBAction func manDidTap(_ sender: UIButton) {
        gender = "남"
        //print(gender!)
        sender.layer.borderColor = UIColor.systemPink.cgColor
        sender.titleLabel?.textColor = .systemPink
    }
    @IBAction func womanDidTap(_ sender: UIButton) {
        gender = "여"
        sender.layer.borderColor = UIColor.systemPink.cgColor
        sender.titleLabel?.textColor = .systemPink
    }
    @IBOutlet weak var userBirth: UITextField!
    // 사용자 아이디
    @IBOutlet weak var userId: UITextField!
    // 아이디 중복체크
    @IBAction func idCheck(_ sender: UIButton) {
    }
    // 초기 비밀번호
    @IBOutlet weak var userPw: UITextField!
    // 비밀번호 같은지 확인
    @IBOutlet weak var userPwCheck: UITextField!
    
    @IBOutlet weak var userEmail: UITextField!
    // 폰번호
    @IBOutlet weak var userPhone: UITextField!
    // 인증번호 보내줘
    @IBAction func sendNumAuth(_ sender: UIButton) {
        let phoneNum = userPhone.text!
        let phoneAuth = AuthModel(phoneNum: phoneNum, phoneAgree: true, idenAgree: true, telAgree: true, indiAgree: true)
        //print("code는 \(SendPhoneAuthDataManager().getAuth(phoneAuth, self))")
        SendPhoneAuthDataManager().getAuth(phoneAuth, self)
    }
    @IBOutlet weak var numAuth: UITextField!
    
    // 전화번호 인증확인
    @IBAction func numAuthCheck(_ sender: UIButton) {
        let phoneNum = userPhone.text!
        let authNum = numAuth.text!
        let authCheck = PhoneAuth(phoneNum: phoneNum, authNum: authNum)
        PhoneAuthDataManager().getCheck(authCheck, self)
    }
    
    //회원가입 눌렀을때
    @IBAction func pressGetSignUpResult(_ sender: UIButton) {
        let uname = userName.text!
        let uage = Int(userBirth.text!) ?? 0
        let uid = userId.text!
        let upw = userPw.text!
        let uemail = userEmail.text!
        let uphone = userPhone.text!
        let authNum = numAuth.text!
        let phoneAgree = true
        let idenAgree = true
        let telAgree = true
        let indiAgree = true
        print(gender!)
        print(uage)
        let userInfo = SignUpModel(id: uid, pw: upw, name: uname, phone: uphone, authNum: authNum, email: uemail, gender: gender!, age: uage, phoneAgree: phoneAgree, idenAgree: idenAgree, telAgree: telAgree, indiAgree: indiAgree)
        SignUpDataManager().getSignUp(userInfo, self)
        
        
        
        //let uid = uidTextField.text!
        //let upw = upwTextField.text!
        //let userInfo = LoginModel(id: uid, pw: upw)
        //SignInDataManager().getLogin(userInfo, self)
        //self.dismiss(animated: false, completion: nil)
        //SignUpDataManager().getSignUp(userInfo,self)
    }
    
    override func viewWillLayoutSubviews() {
        
        //왼쪽 엑스버튼
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "X", style: .plain, target: self, action: #selector(backAction))
        //틴트는 검정색
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        //배경은 화이트
        self.navigationController?.navigationBar.barTintColor = .white
        //라인 지우기
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    @objc func backAction(){
        //print("Back Button Clicked")
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
