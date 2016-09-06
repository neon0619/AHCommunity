//
//  FeaturedStoryCell.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/9/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class FeaturedStoryCell: UITableViewCell {

    @IBOutlet var coverImage: UIImageView!
    @IBOutlet var lblStory: UILabel!
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
