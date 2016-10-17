//
//  AhcTeamCell.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/31/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class AhcTeamCell: UITableViewCell {
    

    @IBOutlet weak var imageWrapper: UIView!
    @IBOutlet var teamImage: UIImageView!
    @IBOutlet var teamName: UILabel!
    @IBOutlet var teamMembers: UILabel!
    @IBOutlet var btnView: UIButton!
    override func awakeFromNib() {
        
        imageWrapper.clipsToBounds = true
    }
}
