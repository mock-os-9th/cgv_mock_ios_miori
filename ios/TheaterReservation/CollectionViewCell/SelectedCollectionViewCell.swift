//
//  SelectedCollectionViewCell.swift
//  ios
//
//  Created by miori Lee on 2020/09/11.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class SelectedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var theaterName: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        theaterName.layer.borderColor = UIColor.white.cgColor
        theaterName.layer.borderWidth = 2
        theaterName.layer.cornerRadius = 10
    }
    
}
