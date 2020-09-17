//
//  WholeSeatBtn.swift
//  ios
//
//  Created by miori Lee on 2020/09/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//


import UIKit

class YelloSeatBtn: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.backgroundColor = .clear
        self.layer.borderColor = UIColor.yellow.cgColor
        //self.tintColor = UIColor.white
        
    }


    

}
