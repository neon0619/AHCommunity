//
//  FeaturedVideoCell.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/31/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class FeaturedVideoCell: UITableViewCell {

    @IBOutlet var lblDesc: UILabel!
    @IBOutlet var videoPlayer: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
