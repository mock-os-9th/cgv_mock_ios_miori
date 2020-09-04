//
//  LoginModel.swift
//  ios
//
//  Created by miori Lee on 2020/09/04.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import Foundation

class LoginModel{
    
  //사용할 변수들을 선언해주며 되도록 외부에서 참조될 수 없는 private으로 선언
  private var _uid: String!
  private var _upw: String!
 
//get과 set를 통해서 데이터를 컨트롤
  var uid: String{
    return _uid
  }
 
  var upw: String{
    return _upw
  }
 
 
  //이니셜라이징
  init(id:String, pw:String){
    self._uid = id
    self._upw = pw
  }
 
  //이렇게 데이터를 다루는 내용은 되도록 Model에서 전부 처리하도록 한다
//  var userInfo: String{
//    return "\(_uid) \(_upw)"
//  }
}

