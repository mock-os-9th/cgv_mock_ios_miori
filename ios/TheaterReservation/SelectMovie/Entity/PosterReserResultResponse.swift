//
//  PosterReserResultResponse.swift
//  ios
//
//  Created by miori Lee on 2020/09/11.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import ObjectMapper

struct PosterReserResultResponse {
    var code: Int!
    var message: String!
    var result: [PosterReserResult]!
}

extension PosterReserResultResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }

}

struct PosterReserResult {

    var image: String!

}

extension PosterReserResult: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
    
        image <- map["image"]
     
    }

}


