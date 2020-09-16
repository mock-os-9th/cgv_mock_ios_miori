//
//  DetailMovieResponse.swift
//  ios
//
//  Created by miori Lee on 2020/09/15.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import ObjectMapper

struct DetailMovieResponse {
    var code: Int!
    var message: String!
    var result: [DetailMovie]!
}

extension DetailMovieResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }

}

struct DetailMovie {
    var titleKo: String!
    var ageLimit : String!
    var bookingRate: String!
    var image: String!
    var totalAud : Int!
    var todayAud : Int!
    var now : Bool!
}

extension DetailMovie: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        titleKo <- map["titleKo"]
        ageLimit <- map["ageLimit"]
        bookingRate <- map["bookingRate"]
        image <- map["image"]
        totalAud <- map["totalAud"]
        todayAud <- map["todayAud"]
        now <- map["now"]

    }

}

