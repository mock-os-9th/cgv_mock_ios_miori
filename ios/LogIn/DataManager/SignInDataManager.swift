//
//  SignInDataManager.swift
//  ios
//
//  Created by miori Lee on 2020/09/03.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class SignInDataManager : BaseViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getLogin(_ userinfo : LoginModel, _ linputViewController: LInputViewController ){
        //let uid = "miori12345"
        //let upw = "abcde12345!"
        let parameter: [String:Any] = [
            "id" : userinfo.uid,
            "pw" : userinfo.upw
        ]
        UserDefaults.standard.set("",forKey: "x-access-token")
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            
            //test용으로 뒤에 "/movies" 추가함 -> 성공!
            .request("\(self.appDelegate.baseUrl)/login", method: .post, parameters: parameter, encoding: JSONEncoding.default)
            
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<LoginResultResponse>) in
                switch response.result {
                case .success(let resultResponse):
                    //print("dd: \(resultResponse)")
                    if resultResponse.code == 100 {
                        print("code:100 완벽한 성공띠")
                        print(resultResponse.result.jwt!)
                        //mainViewController.titleLabel.text = resultResponse.message
                        //LogInMenuViewController().profileInfo.setTitle(LInputViewController().uidTextField.text!, for: .normal)
                        //user defaults 로 jwt 저장
                        let receiveJWT = resultResponse.result.jwt!
                        UserDefaults.standard.set(receiveJWT, forKey: "x-access-token") // Save
                        print(receiveJWT)
                        
                        let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
                            //아이디 필드로 포커스 이동
                            linputViewController.dismiss(animated: false, completion: nil)
                        }
                        linputViewController.presentAlertWithAction(title: "로그인 성공", message: "환영합니다", customAction)
                        
                        
                        
                    } else {
                        print(resultResponse.code!)
                        
                        let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
                            //아이디 필드로 포커스 이동
                            linputViewController.uidTextField.becomeFirstResponder()
                        }
                        linputViewController.presentAlertWithAction(title: "로그인 실패", message: "회원가입을 먼저해주세요", customAction)
                        
                        linputViewController.uidTextField.text = ""
                        linputViewController.upwTextField.text = ""
                        
                        
                        //mainViewController.titleLabel.text = "튜토리얼 정보를 불러오는데 실패하였습니다."
                    }
                case .failure:
                    print("서버와의 연결이 원할하지 않습니다")
                    //mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                }
            })
        
    }
}


