//
//  AhcTeamDescriptionCell.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/23/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class AhcTeamDescriptionCell: UITableViewCell {

    
    @IBOutlet weak var lblTeamCaptain: UILabel!
    @IBOutlet var lblTeamCreated: UILabel!
    @IBOutlet var lblMembers: UILabel!
    @IBOutlet var lblTeamDescriptions: UILabel!
    
    override func awakeFromNib() {

        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
