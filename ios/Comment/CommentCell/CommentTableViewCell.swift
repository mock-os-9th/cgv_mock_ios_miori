//
//  TableViewCell.swift
//  ios
//
//  Created by miori Lee on 2020/09/17.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // 둥글게 둥글게
        profileImg.layer.cornerRadius = profileImg.frame.width/8
        profileImg.clipsToBounds = true
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
