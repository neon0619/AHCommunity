//
//  SideMenuContainer.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/8/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit
import SideMenuController

class SideMenuContainer: SideMenuController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performSegue(withIdentifier: "showHome", sender: nil)
        performSegue(withIdentifier: "containSideMenu", sender: nil)
    }
}
