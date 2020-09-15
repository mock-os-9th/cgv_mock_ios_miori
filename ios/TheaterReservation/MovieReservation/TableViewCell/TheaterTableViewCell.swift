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
    @IBOutlet weak var myCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //recylcyer view 보완
    override func prepareForReuse() {
          super.prepareForReuse()
          self.updateLayout()
        // cell 배경 초기화
        myCell.backgroundColor = UIColor.white
        locationLabel.font = UIFont.systemFont(ofSize: 16)
     locationLabel.textColor = .black
        
      }
      
      func updateLayout(){
          self.setNeedsLayout()
          self.layoutIfNeeded()
      }
    
}
