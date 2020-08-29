//
//  String.swift
//  ios
//
//  Created by Jerry Jung on 07/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit

// 참고 = https://hcn1519.github.io/articles/2017-03/iOS_LanguageSupport
// 참고 = https://code.i-harness.com/ko-kr/q/2b73b26#3
//StringExtension 사용 예제
//editLabel.text = "Edit"
//
//editLabel.text = "Edit".localized // extension으로 구현

//변수 포함 스트링 사용 예제
//let myName = "Sam"
//let friend = "Tom"
//let myNum = 10
//
//titleLabel.text = String(format: NSLocalizedString("Hello %@, This is %@", comment: ""), myName, friend)
// Hello Sam, This is Tom
//titleLabel.text = String(format: NSLocalizedString("Hello %d", comment: ""), myNum)
// Hello 10
extension String {
    var localized: String {
        //return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
        return NSLocalizedString(self, comment: "")
    }
    
    func localizedWith(value: String) -> String {
        return String(format: NSLocalizedString(self, comment: ""), value)
    }
    
    func substring(from: Int, to: Int) -> String {
        let start = index(startIndex, offsetBy: from)
        let end = index(start, offsetBy: to - from)
        return String(self[start ..< end])
    }
    
    func substring(range: NSRange) -> String {
        return substring(from: range.lowerBound, to: range.upperBound)
    }
    
    func replace(target: String, withString: String) -> String{
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    var insertComma: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal // 소수점이 있는 경우 처리
        if let _ = self.range(of: ".") {
            var numberArray = self.components(separatedBy: ".")
            if numberArray.count == 1 {
                var numberString = numberArray[0]
                if numberString.isEmpty {
                    numberString = "0"
                }
                guard let doubleValue = Double(numberString)
                    else { return self }
                return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self
            } else if numberArray.count == 2 {
                var numberString = numberArray[0]
                if numberString.isEmpty {
                    numberString = "0"
                }
                guard let doubleValue = Double(numberString)
                    else {
                        return self
                }
                return (numberFormatter.string(from: NSNumber(value: doubleValue)) ?? numberString) + ".\(numberArray[1])"
            }
        }
        else {
            guard let doubleValue = Double(self)
                else {
                    return self
            }
            return numberFormatter.string(from: NSNumber(value: doubleValue)) ?? self
        }
        return self
    }
    
    
}
