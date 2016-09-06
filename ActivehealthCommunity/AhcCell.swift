//
//  AhcCell.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/22/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class AhcCell: UITableViewCell {

   
    @IBOutlet var lbldesc: UILabel!
    @IBOutlet var img: UIImageView!
    @IBOutlet var btnView: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
