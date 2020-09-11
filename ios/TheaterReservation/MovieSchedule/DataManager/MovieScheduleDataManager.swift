//
//  MovieScheduleDataManager.swift
//  ios
//
//  Created by miori Lee on 2020/09/12.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class MovieScheduleDataManager : BaseViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getLogin(_ userinfo : LoginModel, _ theaterRMainViewController: TheaterRMainViewController ){
 
        let parameter: [String:Any] = [
            "id" : userinfo.uid,
            "pw" : userinfo.upw
        ]
        UserDefaults.standard.set("",forKey: "x-access-token")
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            
            //test용으로 뒤에 "/movies" 추가함 -> 성공!
            .request("\(self.appDelegate.baseUrl)/schedule", method: .post, parameters: parameter, encoding: JSONEncoding.default)
            
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<ScheduleResponse>) in
                switch response.result {
                case .success(let resultResponse):
                    //print("dd: \(resultResponse)")
                    if resultResponse.code == 100 {
                        print("code:100 완벽한 성공띠")
                        
            
                        
                    } else {
                        print(resultResponse.code!)
                        
                
                    }
                case .failure:
                    print("서버와의 연결이 원할하지 않습니다")
          
                }
            })
        
    }
}


