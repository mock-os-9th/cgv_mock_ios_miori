//
//  HomeResultResponse.swift
//  ios
//
//  Created by miori Lee on 2020/09/11.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import ObjectMapper

struct HomeResultResponse {
    var code: Int!
    var message: String!
    var result: [HomeResult]!
}

extension HomeResultResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }

}

struct HomeResult {
    var titleKo: String!
    var bookingRate: String!
    var image: String!

}

extension HomeResult: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        titleKo <- map["titleKo"]
        bookingRate <- map["bookingRate"]
        image <- map["image"]
     
    }

}

