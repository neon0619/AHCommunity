//
//  MenuCell.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 7/27/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var imgIcon: UIImageView!
    
    override func awakeFromNib() {
        
    }
    
    func setCellDetails(_ menu: Menu) {
        
        lblTitle.text = menu.title
        imgIcon.image = menu.image
    }
}
