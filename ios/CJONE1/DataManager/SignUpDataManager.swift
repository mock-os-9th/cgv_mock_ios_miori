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

class SignUpDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getTutorials(_ cj1ViewController: CJ1ViewController) {
        //let uid = "miori12345"
        //let upw = "abcde12345!"
        let parameter: [String:Any] = [
            "id" : "miori11111",
            "pw" : "abcde12345!",
            "name" : "이제야되는구나마지막체크",
            "phone" : "01011111111",
            "email" : "abcd1234@naver.com",
            "gender" : "여",
            "age" : 24,
            "phoneAgree" : true,
            "idenAgree" : true,
            "telAgree" : true,
            "indiAgree" : true
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
                    } else {
                        print(resultResponse.code)
                        //mainViewController.titleLabel.text = "튜토리얼 정보를 불러오는데 실패하였습니다."
                    }
                case .failure:
                    print("서버와의 연결이 원할하지 않습니다")
                    //mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                }
            })
    }
}
