//
//  DisabilityBtn.swift
//  ios
//
//  Created by miori Lee on 2020/09/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class DisabilityBtn: UIButton {

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
        self.backgroundColor = UIColor.flora()
        self.layer.borderColor = UIColor.flora().cgColor
        //self.setTitle("X", for: .normal)
        self.titleLabel?.textColor = UIColor.white
        //self.tintColor = UIColor.white
        
    }


    

}

extension UIColor {
    class func flora() -> UIColor {
        return UIColor(red:102/255, green:255/255, blue:102/255, alpha:1.0)
    }
}
