//
//  AuthModel.swift
//  ios
//
//  Created by miori Lee on 2020/09/07.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation

class AuthModel{
    
    //사용할 변수들을 선언해주며 되도록 외부에서 참조될 수 없는 private으로 선언
    private var _phoneNum: String!
    private var _phoneAgree: Bool
    private var _idenAgree : Bool
    private var _telAgree : Bool
    private var _indiAgree : Bool

    
    //get과 set를 통해서 데이터를 컨트롤
    var phoneNum: String{
        return _phoneNum
    }
    
    var phoneAgree: Bool{
        return _phoneAgree
    }
    
    var idenAgree: Bool{
        return _idenAgree
    }
    
    var telAgree: Bool{
        return _telAgree
    }
    
    var indiAgree : Bool{
        return _indiAgree
    }
    

    
    //이니셜라이징
    init(phoneNum : String, phoneAgree : Bool, idenAgree : Bool, telAgree : Bool, indiAgree : Bool){
        self._phoneNum = phoneNum
        self._phoneAgree = phoneAgree
        self._idenAgree = idenAgree
        self._telAgree = telAgree
        self._indiAgree = indiAgree

    }
    
    //이렇게 데이터를 다루는 내용은 되도록 Model에서 전부 처리하도록 한다
    //  var userInfo: String{
    //    return "\(_uid) \(_upw)"
    //  }
}

