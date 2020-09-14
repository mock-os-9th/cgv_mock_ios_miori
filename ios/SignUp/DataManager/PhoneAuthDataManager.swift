//
//  PhoneAuthDataManager.swift
//  ios
//
//  Created by miori Lee on 2020/09/08.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

//전화인증 데이터매니저
class PhoneAuthDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getCheck(_ phoneauth : PhoneAuth,_ cj1ViewController: CJ1ViewController) {
        //let uid = "miori12345"
        //let upw = "abcde12345!"
        let parameter: [String:Any] = [

            "phone" : phoneauth.phoneNum,
            "authNum" : phoneauth.authNum
            ]
     
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            
            //test용으로 뒤에 "/movies" 추가함 -> 성공!
            .request("\(self.appDelegate.baseUrl)/auth/num", method: .post, parameters: parameter, encoding: JSONEncoding.default)
                
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
                        cj1ViewController.presentAlertWithAction(title: "전화번호인증완료", message: "회원가입버튼을 눌러주세요", customAction)
                        //mainViewController.titleLabel.text = resultResponse.message
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

