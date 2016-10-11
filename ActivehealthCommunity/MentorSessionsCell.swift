//
//  MentorSessionsCell.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 10/7/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class MentorSessionsCell: UITableViewCell {

    
    @IBOutlet var rowImage: UIImageView!
    @IBOutlet var btnJoin: UIButton!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblSlots: UIView!
    @IBOutlet var lblCoach: UILabel!
    @IBOutlet var lblLocation: UILabel!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
