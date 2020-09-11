//
//  PosterResetDataManager.swift
//  ios
//
//  Created by miori Lee on 2020/09/11.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PosterResetDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var dmPosterArr : [String] = [String]()
 
    
    func getMoviePoster( _ selectMovieViewController: SelectMovieViewController) {
       
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            
            //test용으로 뒤에 "/movies" 추가함 -> 성공!
            .request("\(self.appDelegate.baseUrl)/movies", method: .get)
                
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<PosterReserResultResponse>) in
                switch response.result {
                case .success(let resultResponse):
                    if resultResponse.code == 100 {
                        print(resultResponse.code!)
                        //result 부분에서 이미지만 받아와
                        
                        for i in resultResponse.result{
                            //print("dd : \(i.image!)")
                            // 이미지링크 (string) 받아와서 배열에 저장
                            // 아래는 vc에서 moviePoster가 단순 배열 이었을 때
                            self.dmPosterArr.append(i.image!)
                       
                            //theaterRMainViewController.moviePoster.append(i.image!)
                            //moviePoster.movieImage.append(i.image!)
                            
                            //moviePoster.append(MoviePosterModel(imageURL: i.image!))
                           
                        }
                        //print("dm : \(theaterRMainViewController.moviePoster)")
                        selectMovieViewController.posterArr = self.dmPosterArr
                        
                        // 리로드 데이터 콜렉션뷰
                        selectMovieViewController.posterCV.reloadData()
                        print("finish")

                    } else {
                        print(resultResponse.code!)
                    }
                case .failure:
                    print("서버와의 연결이 원할하지 않습니다")
                }
            })
        
    }
}

