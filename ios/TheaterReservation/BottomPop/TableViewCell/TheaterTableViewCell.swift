//
//  TheaterTableViewCell.swift
//  ios
//
//  Created by miori Lee on 2020/09/11.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class TheaterTableViewCell: UITableViewCell {

    @IBOutlet weak var locationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
