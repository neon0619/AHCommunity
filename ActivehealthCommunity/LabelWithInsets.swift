//
//  LabelWithInsets.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/24/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class LabelWithInsets: UILabel {

    override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 0, left: 30, bottom: 0, right: 5)
        super.drawTextInRect(UIEdgeInsetsInsetRect(rect, insets))
    }

}
