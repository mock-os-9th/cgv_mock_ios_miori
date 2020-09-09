//
//  SendPhoneAuthDataManager.swift
//  ios
//
//  Created by miori Lee on 2020/09/07.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//


import Foundation
import Alamofire
import AlamofireObjectMapper

class SendPhoneAuthDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    // code 반환해서 팝업 띄어줄거임!
    func getAuth(_ userinfo : AuthModel,_ cj1ViewController: CJ1ViewController) {
        //let uid = "miori12345"
        //let upw = "abcde12345!"
        
        let parameter: [String:Any] = [
            
            "phone" : userinfo.phoneNum,
            "phoneAgree" : true,
            "idenAgree" : true,
            "telAgree" : true,
            "indiAgree" : true
        ]
        
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            
            //test용으로 뒤에 "/movies" 추가함 -> 성공!
            .request("\(self.appDelegate.baseUrl)/auth", method: .post, parameters: parameter, encoding: JSONEncoding.default)
            
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<ResultResponse>) in
                switch response.result {
                case .success(let resultResponse):
                    //print("dd: \(resultResponse)")
                    if resultResponse.code == 100 {
               
                        print("code:100 완벽한 성공띠")
                        //팝업을 띄울거야
                            let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
                                print("닫음")
                                //navigationViewController.pushViewController(MainViewController(), animated: true)
                            }
                        cj1ViewController.presentAlertWithAction(title: "문자전송완료", message: "인증번호를 확인후, 입력해주세요", customAction)
                        
                        //mainViewController.titleLabel.text = resultResponse.message
                    } else {
                        //팝업을 띄울거야
                            let customAction = UIAlertAction(title: "확인", style: .destructive) { _ in
                                print("닫음")
                                //navigationViewController.pushViewController(MainViewController(), animated: true)
                            }
                        cj1ViewController.presentAlertWithAction(title: "ERROR", message: "에러발생", customAction)
                        print(resultResponse.code!)
                        
                        //mainViewController.titleLabel.text = "튜토리얼 정보를 불러오는데 실패하였습니다."
                    }
                case .failure:
                    //code = 444
                    print("서버와의 연결이 원할하지 않습니다")
                    //mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                }
            })
        
        
        
    }
}

