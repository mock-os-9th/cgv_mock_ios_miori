//
//  ResultResponse.swift
//  ios
//
//  Created by miori Lee on 2020/09/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResultResponse {
    var code: Int!
    var message: String!
    var result: String!
}

extension ResultResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
    
}
//
//struct Tutorial {
//    //var seq: Int!
//    //var type: String!
//    var jwt: String!
//    //var pw: String!
//}
//
//extension Tutorial: Mappable {
//
//    init?(map: Map) {
//    }
//
//    mutating func mapping(map: Map) {
//        //seq <- map["seq"]
//        //type <- map["type"]
//        jwt <- map["jwt"]
//        //pw <- map["pw"]
//    }
//
//}
