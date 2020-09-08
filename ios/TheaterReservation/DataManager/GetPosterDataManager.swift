//
//  GetPosterDataManager.swift
//  ios
//
//  Created by miori Lee on 2020/09/08.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class GetPosterDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getPosterImage(_ theaterRMainViewController: TheaterRMainViewController) {
        //let uid = "miori12345"
        //let upw = "abcde12345!"
        //get 은 param 필요 없어
//        let parameter: [String:Any] = [
//
//            "image" : movieInfo.image,
//
//        ]
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            
            //test용으로 뒤에 "/movies" 추가함 -> 성공!
            .request("\(self.appDelegate.baseUrl)/movies", method: .get)
                
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<MoviePosterResultResponse>) in
                switch response.result {
                case .success(let resultResponse):
                    //print("dd: \(resultResponse)")
                    if resultResponse.code == 100 {
                        print(resultResponse.code!)
                        print("dd : \(resultResponse)")
                        //theaterRMainViewController.moviePoster.append(resultResponse.result!.moviePoster)
                        //print(theaterRMainViewController.moviePoster)
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

