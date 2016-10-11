//
//  GeneralDetailsCell.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 10/7/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class GeneralDetailsCell: UITableViewCell {

    
    @IBOutlet var lblLevel: UILabel!
    @IBOutlet var lblDay: UILabel!
    @IBOutlet var lblWeek: UILabel!
    @IBOutlet var lblDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
