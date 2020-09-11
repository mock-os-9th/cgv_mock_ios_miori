//
//  ScheduleResponse.swift
//  ios
//
//  Created by miori Lee on 2020/09/12.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation
import ObjectMapper

struct ScheduleResponse {
    var code: Int!
    var message: String!
    var result: [Schedule]!
}

extension ScheduleResponse: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        result <- map["result"]
    }
    
}

struct Schedule {
    var scheduleID : String!
    var theater : String!
    var screen : String!
    var screenType : String!
    var capacity : Int!
    var date : String!
    var title : String!
    var ageLimit : Int!
    var playTime : String!
    var startTime : String!
    var endTime : String!
    var count : Int!
    var distance : String!
    
    
}

extension Schedule: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        scheduleID <- map["scheduleID"]
        theater <- map["theater"]
        screen <- map["screen"]
        screenType <- map["screenType"]
        capacity <- map["capacity"]
        date <- map["date"]
        title <- map["title"]
        ageLimit <- map["ageLimit"]
        playTime <- map["playTime"]
        startTime <- map["startTime"]
        endTime <- map["endTime"]
        count <- map["count"]
        distance <- map["distance"]
        
    }
    
}

