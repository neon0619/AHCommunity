//
//  ClassesTableViewCell.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/9/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class ClassesCell: UITableViewCell {

    @IBOutlet var coverImage: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var lblVenue: UILabel!
    @IBOutlet var lblFee: UILabel!
    @IBOutlet var btnJoin: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func Join(_ sender: AnyObject) {
        
        print("haha")
    }
}
