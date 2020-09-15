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
    var dmPosterArr : [String] = [String]()
    var dmMovieNameArr : [String] = [String]()
    var dmMoviePercent : [String] = [String]()
    
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
                            detailMovieViewController.movieDict.updateValue(i.titleKo!, forKey: "titleKo")
                           
                        }
                        //print("dm : \(theaterRMainViewController.moviePoster)")
                        
                        // 리로드 데이터 콜렉션뷰
                        //homeViewController.midCollectionView.reloadData()
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

