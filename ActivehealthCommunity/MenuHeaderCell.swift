//
//  MenuHeaderCellTableViewCell.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/1/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class MenuHeaderCell: UITableViewCell {

    @IBOutlet var userImage: UIImageView!
    @IBOutlet var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        self.layoutIfNeeded()
        userImage.layer.borderWidth = 1
        userImage.layer.masksToBounds = false
        userImage.layer.borderColor = UIColor.black.cgColor
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
