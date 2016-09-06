//
//  ProfileViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 9/1/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var swiftPagesView: SwiftPages!
    
    override func viewDidLoad() {
        
         automaticallyAdjustsScrollViewInsets = false
        
        let VCIDs = ["userProfileController","classesController"]
        let buttonImages = [
            UIImage(named:"bio_icon")!,
            UIImage(named:"placeholder10")!
        ]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let VCsInstanciated = VCIDs.map({ storyboard.instantiateViewControllerWithIdentifier($0) })
        
        
        // Sample customization
        swiftPagesView.initializeWithVCsInstanciatedArrayAndButtonImagesArray(VCsInstanciated, buttonImagesArray: buttonImages)
        //swiftPagesView.initializeWithVCIDsArrayAndButtonImagesArray([], buttonImagesArray: buttonImages)
        swiftPagesView.setTopBarBackground(UIColor.clearColor())
        swiftPagesView.setAnimatedBarColor(UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 1.0))
        swiftPagesView.setContainerViewBackground(UIColor.blueColor())
        
    }
    
    

}
