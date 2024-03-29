//
//  DetailMovieDataManager.swift
//  ios
//
//  Created by miori Lee on 2020/09/15.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class DetailMovieDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    func getMovieInfo( _ detailMovieViewController: DetailMovieViewController) {
        
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            
            //test용으로 뒤에 "/movies" 추가함 -> 성공!
            .request("\(self.appDelegate.baseUrl)/movies", method: .get)
            
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<DetailMovieResponse>) in
                switch response.result {
                case .success(let resultResponse):
                    if resultResponse.code == 100 {
                        print(resultResponse.code!)
                        //result 부분에서 이미지만 받아와
                        
                        // 뷰컨트롤러 딕셔너리 접근
                        for i in resultResponse.result{
                            
                            detailMovieViewController.movieDetail.titleKo.append(i.titleKo!)
                            
                            detailMovieViewController.movieDetail.ageLimit.append(i.ageLimit!)
                            
                            detailMovieViewController.movieDetail.bookingRate.append(i.bookingRate!)
                            
                            detailMovieViewController.movieDetail.image.append(i.image!)
                            
                            detailMovieViewController.movieDetail.now.append(i.now!)
                            
                            // now
                            if i.now! == "yes" {
                                detailMovieViewController.movieDetail.nowMovie.append(i.titleKo!)
                            }
                            
                            // none 값 대체
                            let alternativeTotal = i.totalAud ?? 0
                            detailMovieViewController.movieDetail.totalAud.append(alternativeTotal)
                            
                            let alternativeToday = i.todayAud ?? 0
                            detailMovieViewController.movieDetail.todayAud.append(alternativeToday)
                         
                        }
                        //print("dm : \(detailMovieViewController.movieDetail.todayAud)")
                        
                        // 리로드 데이터 테이블뷰
                        detailMovieViewController.detailTV.reloadData()
                        
                        print("dm : \(detailMovieViewController.movieDetail.nowMovie)")
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

