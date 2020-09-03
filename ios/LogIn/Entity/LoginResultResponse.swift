//
//  LoginResultResponse.swift
//  ios
//
//  Created by miori Lee on 2020/09/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//


import Foundation
import ObjectMapper

struct LoginResultResponse {
    var code: Int!
    var message: String!
    var result: Result!
}

extension LoginResultResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }

}

struct Result {
    var jwt: String!

}

extension Result: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        jwt <- map["jwt"]
     
    }

}
