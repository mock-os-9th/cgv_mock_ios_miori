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
    
    @IBOutlet weak var manBtn: UIButton!
    @IBOutlet weak var womanBtn: UIButton!
    // 성별 버튼 터치 이벤트
    @IBAction func genderDidTap(_ sender: UIButton) {
        if sender.tag == 0 {
            gender = "남"
            //print(gender!)
            //여자 버튼은 안눌리게
            self.IsBtnSelected(isSelect: true, with: self.manBtn)
            sender.layer.borderColor = UIColor(hex: ColorPalette.cgvPink, alpha: 1.0).cgColor
            //border width속성을 줘야 테두리가 표시됨!!
            sender.layer.borderWidth = 2
            sender.setTitleColor(UIColor(hex: ColorPalette.cgvPink, alpha: 1.0), for: .normal)
            womanBtn.layer.borderColor = UIColor.black.cgColor
            womanBtn.setTitleColor(.black, for: .normal)
            womanBtn.layer.borderWidth = 0
            
        } else {
            gender = "여"
            
            self.IsBtnSelected(isSelect: true, with: self.womanBtn)
            sender.layer.borderColor = UIColor(hex: ColorPalette.cgvPink, alpha: 1.0).cgColor
            //border width속성을 줘야 테두리가 표시됨!!
            sender.layer.borderWidth = 2
            sender.setTitleColor(UIColor(hex: ColorPalette.cgvPink, alpha: 1.0), for: .normal)
            manBtn.layer.borderColor = UIColor.black.cgColor
            manBtn.setTitleColor(.black, for: .normal)
            manBtn.layer.borderWidth = 0
        }
        
    }
    
    func IsBtnSelected(isSelect:Bool,with sender:UIButton){
        self.manBtn.isSelected = false
        self.womanBtn.isSelected = false
        sender.isSelected = isSelect
    }
    
    @IBOutlet weak var userBirth: UITextField!
    // 사용자 아이디
    @IBOutlet weak var userId: UITextField!
    // 아이디 중복체크
    @IBAction func idCheck(_ sender: UIButton) {
        self.presentAlert(title: "사용가능", message: "아이디가 중복되지 않습니다")
    }
    // 초기 비밀번호
    @IBOutlet weak var userPw: UITextField!
    // 비밀번호 같은지 확인
    @IBOutlet weak var userPwCheck: UITextField!
    // 비밀번호 일치 여부 라벨
    @IBOutlet weak var pwCheckResult: UILabel!
    
    
    @IBOutlet weak var userEmail: UITextField!
    // 폰번호
    @IBOutlet weak var userPhone: UITextField!
    
    @IBOutlet weak var allAgree: RadioButton!
    @IBOutlet weak var agree1: RadioButton!
    @IBOutlet weak var agree2: RadioButton!
    @IBOutlet weak var agree3: RadioButton!
    @IBOutlet weak var agree4: RadioButton!
    
    // 인증번호 보내줘
    @IBAction func sendNumAuth(_ sender: UIButton) {
        let phoneNum = userPhone.text!
        let phoneAuth = AuthModel(phoneNum: phoneNum, phoneAgree: true, idenAgree: true, telAgree: true, indiAgree: true)
        //print("code는 \(SendPhoneAuthDataManager().getAuth(phoneAuth, self))")
        SendPhoneAuthDataManager().getAuth(phoneAuth, self)
    }
    // 전체 동의 눌렀을 떄
    @IBAction func checkAllAgree(_ sender: RadioButton) {
        print("clicked")
        agree1.isChecked = true
        agree2.isChecked = true
        agree3.isChecked = true
        agree4.isChecked = true
        
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
        //print(gender!)
        //print(uage)
        let userInfo = SignUpModel(id: uid, pw: upw, name: uname, phone: uphone, authNum: authNum, email: uemail, gender: gender!, age: uage, phoneAgree: phoneAgree, idenAgree: idenAgree, telAgree: telAgree, indiAgree: indiAgree)
        SignUpDataManager().getSignUp(userInfo, self)
        
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
        userName.tag = 0
        userBirth.tag = 2
        userId.tag = 3
        userPw.tag = 4
        userPwCheck.tag = 5
        userEmail.tag = 6
        userPhone.tag = 7
        numAuth.tag = 8
        userName.delegate = self
        userBirth.delegate = self
        userId.delegate = self
        userPw.delegate = self
        userPwCheck.delegate = self
        userEmail.delegate = self
        userPhone.delegate = self
        numAuth.delegate = self
        
        agree1.tag = 1
        agree2.tag = 2
        agree3.tag = 3
        agree4.tag = 4
        
        manBtn.tag = 0
        womanBtn.tag = 1
        
        
        
        
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
// retunr key 눌렀을 때 다음 텍스트 필드 자동 포커스
extension CJ1ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        // Try to find next responder
        let nextResponder = textField.superview?.viewWithTag(nextTag) as UIResponder?
        
        if nextResponder != nil {
            // Found next responder, so set it
            nextResponder?.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard
            textField.resignFirstResponder()
        }
        
        if nextTag == 6 {
            if userPw.text! == userPwCheck.text! {
                pwCheckResult.text = "비밀번호가 일치해요"
                pwCheckResult.textColor = .systemBlue
            } else {
                pwCheckResult.text = "비밀번호가 일치하지 않아요"
                pwCheckResult.textColor = .systemRed
                userPwCheck.text = ""
                userPwCheck.becomeFirstResponder()
            }
        }
        
        return false
    }
}
