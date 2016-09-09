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
    @IBOutlet var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        
         automaticallyAdjustsScrollViewInsets = false
        
        let VCIDs = ["userProfileController","myPreviouseRacesController","upcomingRaceController"]
        let buttonImages = [
            UIImage(named:"bio_icon")!,
            UIImage(named:"bio_icon")!,
            UIImage(named:"bio_icon")!
        ]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let VCsInstanciated = VCIDs.map({ storyboard.instantiateViewControllerWithIdentifier($0) })
//        VCsInstanciated[0].view.frame = CGRectMake(0, 300, self.view.frame.width, 500)
        
        
        
        // Sample customization
        swiftPagesView.initializeWithVCsInstanciatedArrayAndButtonImagesArray(VCsInstanciated, buttonImagesArray: buttonImages)
        //swiftPagesView.initializeWithVCIDsArrayAndButtonImagesArray([], buttonImagesArray: buttonImages)
        swiftPagesView.setTopBarBackground(UIColor(patternImage: UIImage(named: "placeholder2")!))
//        swiftPagesView.setTopBarBackground(UIColor.cl)
        swiftPagesView.setAnimatedBarColor(UIColor(red: 255/255, green: 250/255, blue: 205/255, alpha: 1.0))
        swiftPagesView.setContainerViewBackground(UIColor.lightGrayColor())
        
        self.navBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navBar.shadowImage = UIImage()
        self.navBar.translucent = true
        
    }
    
    override func viewDidAppear(animated: Bool) {
    }

    
    @IBAction func dismissController(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func changeProfilePicture(sender: AnyObject) {
    }
    
}
