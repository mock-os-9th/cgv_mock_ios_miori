//
//  SignUpDataManager.swift
//  ios
//
//  Created by miori Lee on 2020/09/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class SignUpDataManager : BaseViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getSignUp(_ userinfo : SignUpModel,_ cj1ViewController: CJ1ViewController) {
        //let uid = "miori12345"
        //let upw = "abcde12345!"
        let parameter: [String:Any] = [
            
            "id" : userinfo.uid,
            "pw" : userinfo.upw,
            "name" : userinfo.name,
            "phone" : userinfo.phone,
            "authNum" : userinfo.authNum,
            "email" : userinfo.email,
            "gender" : userinfo.gender,
            "age" : userinfo.age,
            "phoneAgree" : userinfo.phoneAgree,
            "idenAgree" : userinfo.idenAgree,
            "telAgree" : userinfo.telAgree,
            "indiAgree" : userinfo.indiAgree
        ]
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            
            //test용으로 뒤에 "/movies" 추가함 -> 성공!
            .request("\(self.appDelegate.baseUrl)/user", method: .post, parameters: parameter, encoding: JSONEncoding.default)
            
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<ResultResponse>) in
                switch response.result {
                case .success(let resultResponse):
                    //print("dd: \(resultResponse)")
                    if resultResponse.code == 100 {
                        print("code:100 완벽한 성공띠")
                        //mainViewController.titleLabel.text = resultResponse.message
                        // 회원가입 완료 alert 후 이동하는 함수
                        let goLoginAction = UIAlertAction(title: "로그인하러가기", style: .default) { _ in
                            
                            //
                            cj1ViewController.dismiss(animated: true, completion: nil)
                        }
                        
                        cj1ViewController.presentAlertWithAction(title: "회원가입완료", message: "회원가입을 축하드립니다. 로그인 화면으로 이동하시겠어요?", goLoginAction)
                        
                        
                        
                        
                        
                    } else {
                        print(resultResponse.code!)
                        //mainViewController.titleLabel.text = "튜토리얼 정보를 불러오는데 실패하였습니다."
                        
                    }
                    
                case .failure:
                    print("서버와의 연결이 원할하지 않습니다")
                    //mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                }
            })
    }
}

