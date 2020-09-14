//
//  PhoneAuth.swift
//  ios
//
//  Created by miori Lee on 2020/09/08.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation

// 인증확인을 위한 모델
class PhoneAuth{
    
    //사용할 변수들을 선언해주며 되도록 외부에서 참조될 수 없는 private으로 선언
    private var _phoneNum: String!
    private var _authNum: String!


    
    //get과 set를 통해서 데이터를 컨트롤
    var phoneNum: String{
        return _phoneNum
    }
    
    var authNum: String{
        return _authNum
    }
    

    

    
    //이니셜라이징
    init(phoneNum : String, authNum : String){
        self._phoneNum = phoneNum
        self._authNum = authNum
    
    }
    
    //이렇게 데이터를 다루는 내용은 되도록 Model에서 전부 처리하도록 한다
    //  var userInfo: String{
    //    return "\(_uid) \(_upw)"
    //  }
}

