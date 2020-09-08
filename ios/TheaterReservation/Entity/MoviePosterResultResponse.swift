//
//  ResultResponse.swift
//  ios
//
//  Created by miori Lee on 2020/09/08.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import ObjectMapper

struct MoviePosterResultResponse {
    var code: Int!
    var message: String!
    var result: [MovieResult]!
    //물음표 빼야하는 이유
}

extension MoviePosterResultResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
    
}

// result 구조
struct MovieResult {
    var movieID: String!
    var titleKo: String!
    var titleEn: String!
    var ageLimit: String!
    var openDate: String!
    var bookingRate: String!
    var totalAud: Int!
    var todayAud: Int!
    var now: String!
    var image: String!
}

extension MovieResult: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        movieID <- map["movieID"]
        titleKo <- map["titleKo"]
        titleEn <- map["titleEn"]
        ageLimit <- map["ageLimit"]
        openDate <- map["openDate"]
        bookingRate <- map["bookingRate"]
        totalAud <- map["totalAud"]
        todayAud <- map["todayAud"]
        now <- map["now"]
        image <- map["image"]
    }

}
