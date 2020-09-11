//
//  GetUserNameDataManager.swift
//  ios
//
//  Created by miori Lee on 2020/09/10.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class GetUserNameDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var dmPosterArr : [String] = [String]()



    //var getJWT = UserDefaults.standard.value(forKey: "x-access-token") as! String
    
  
    func getPosterImage(_ token : TokenModel , _ loginMenuController: LogInMenuViewController) {
        let authheaders = ["x-access-token" : token.token]
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            
            //test용으로 뒤에 "/movies" 추가함 -> 성공!
            .request("\(self.appDelegate.baseUrl)/username", method: .get, headers: authheaders)
                
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<GetNameResultResponse>) in
                switch response.result {
                case .success(let resultResponse):
                    if resultResponse.code == 100 {
                        print(resultResponse.code!)
                        print(resultResponse.result[0].userName!)
                        loginMenuController.nameBtn.titleLabel?.text = resultResponse.result[0].userName!
                        
                    } else {
                        print(resultResponse.code!)
                    }
                case .failure:
                    print("서버와의 연결이 원할하지 않습니다")
                }
            })
        
    }
}

