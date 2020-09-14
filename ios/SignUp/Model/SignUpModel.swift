//
//  SignUpModel.swift
//  ios
//
//  Created by miori Lee on 2020/09/07.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//


import Foundation

//회원가입을 위한 모델
class SignUpModel{
    
    //사용할 변수들을 선언해주며 되도록 외부에서 참조될 수 없는 private으로 선언
    private var _uid: String!
    private var _upw: String!
    private var _name : String!
    private var _phone : String!
    private var _authNum : String!
    private var _email : String!
    private var _gender : String!
    private var _age : Int
    private var _phoneAgree : Bool
    private var _idenAgree : Bool
    private var _telAgree : Bool
    private var _indiAgree : Bool
    
    //get과 set를 통해서 데이터를 컨트롤
    var uid: String{
        return _uid
    }
    
    var upw: String{
        return _upw
    }
    
    var name: String{
        return _name
    }
    
    var phone: String{
        return _phone
    }
    
    var authNum : String{
        return _authNum
    }
    
    var email: String{
        return _email
    }
    
    var gender: String{
        return _gender
    }
    
    var age: Int{
        return _age
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
    
    var indiAgree: Bool{
         return _indiAgree
     }
    
    
    //이니셜라이징
    init(id:String, pw:String, name: String, phone: String, authNum: String, email: String, gender: String, age: Int, phoneAgree : Bool, idenAgree: Bool, telAgree: Bool, indiAgree :Bool){
        self._uid = id
        self._upw = pw
        self._name = name
        self._phone = phone
        self._authNum = authNum
        self._email = email
        self._gender = gender
        self._age = age
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
