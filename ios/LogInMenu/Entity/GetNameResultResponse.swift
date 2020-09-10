//
//  GetNameResultResponse.swift
//  ios
//
//  Created by miori Lee on 2020/09/10.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import ObjectMapper

// username 갖고오기
struct GetNameResultResponse {
    var code: Int!
    var message: String!
    var result: [UserName]!
}

extension GetNameResultResponse: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }

}

struct UserName {
    var userName: String!

}

extension UserName: Mappable {

    init?(map: Map) {
    }

    mutating func mapping(map: Map) {
        userName <- map["userName"]
     
    }

}
