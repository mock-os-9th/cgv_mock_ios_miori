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

        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            
            //test용으로 뒤에 "/movies" 추가함 -> 성공!
            .request("\(self.appDelegate.baseUrl)/movies", method: .get)
                
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<MoviePosterResultResponse>) in
                switch response.result {
                case .success(let resultResponse):
                    if resultResponse.code == 100 {
                        print(resultResponse.code!)
                        //result 부분에서 이미지만 받아와
                        for i in resultResponse.result{
                            //print("dd : \(i.image!)")
                            // 이미지링크 (string) 받아와서 배열에 저장
                            theaterRMainViewController.moviePoster.append(i.image!)
                            //moviePoster.movieImage.append(i.image!)
                        }
                        print("dm : \(theaterRMainViewController.moviePoster)")

                    } else {
                        print(resultResponse.code!)
                    }
                case .failure:
                    print("서버와의 연결이 원할하지 않습니다")
                }
            })
        
    }
}

