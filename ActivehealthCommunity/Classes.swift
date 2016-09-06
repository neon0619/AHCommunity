//
//  Classes.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/11/16.
//  Copyright © 2016 JadeL. All rights reserved.
//
import UIKit


class Classes {
    
    let title: String
    let date: String
    let venue: String
    let regFee: String
    let image: UIImage?
    
    
    init(title: String, date: String, venue: String, regFee: String, image: UIImage?) {
        self.title = title
        self.date = date
        self.venue = venue
        self.regFee = regFee
        self.image = image
    }
    
}