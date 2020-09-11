//
//  ChartCollectionViewCell.swift
//  ios
//
//  Created by miori Lee on 2020/09/11.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class ChartCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var nowBtn: UIButton!
    @IBOutlet weak var reserPercent: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        nowBtn.layer.borderColor = UIColor.systemPink.cgColor
        nowBtn.layer.borderWidth = 2
        nowBtn.layer.cornerRadius = 10

       

        
    }

}
