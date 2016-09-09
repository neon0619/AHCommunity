//
//  CoachProfileController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/24/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class CoachProfileController : UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate {
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var tableView: UITableView!
    
     var interactor:Interactor? = nil
    
    let profileDetails: Array<ProfileDetails> = [ProfileDetails(detailsName: "Email", details: "sample@gmail.com"),ProfileDetails(detailsName: "Gender", details: "Female"),ProfileDetails(detailsName: "Age", details: "30"), ProfileDetails(detailsName: "Location", details: "Cubao"), ProfileDetails(detailsName: "Sports", details: "Track and Fields")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNibs()
        
        self.navBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navBar.shadowImage = UIImage()
        self.navBar.translucent = true

        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return profileDetails.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("detailsCell", forIndexPath: indexPath) as! ProfileDetailsCell
        
        cell.lblDetailsName.text = profileDetails[indexPath.row].detailsName
        cell.lblDetailsName.textColor = UIColor(netHex: 0xFF9310)
        cell.lblDetails.text = profileDetails[indexPath.row].details
        
        return cell
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = CoachHeaderCell.fromNib()
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
         return 250
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
         return 64
    }
    

    @IBAction func handleGesture(sender: UIPanGestureRecognizer) {
        
        let percentThreshold:CGFloat = 0.3
        
        // convert y-position to downward pull progress (percentage)
        let translation = sender.translationInView(view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        guard let interactor = interactor else { return }
        
        switch sender.state {
        case .Began:
            interactor.hasStarted = true
            dismissViewControllerAnimated(true, completion: nil)
        case .Changed:
            interactor.shouldFinish = progress > percentThreshold
            interactor.updateInteractiveTransition(progress)
        case .Cancelled:
            interactor.hasStarted = false
            interactor.cancelInteractiveTransition()
        case .Ended:
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finishInteractiveTransition()
                : interactor.cancelInteractiveTransition()
        default:
            break
        }
    }
   
    @IBAction func status(sender: AnyObject) {
        
        let statusAlertController = storyboard!.instantiateViewControllerWithIdentifier("statusAlertController") as! StatusViewController
        statusAlertController.modalPresentationStyle = UIModalPresentationStyle.Popover
        statusAlertController.preferredContentSize = CGSize(width: 200, height: statusAlertController.sportsList.count * 58)
        let popOver = statusAlertController.popoverPresentationController
        popOver?.delegate = self
        popOver?.sourceView = self.view
        popOver?.sourceRect = CGRect(x: (self.navBar.frame.origin.x) + 370, y: (self.navBar.frame.origin.y) + 20, width: 10, height: 10)
        self.presentViewController(statusAlertController, animated: true, completion: nil)
    }
    
    @IBAction func sleepTimer(sender: AnyObject) {
    }
   
    func loadNibs() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let detailsCell = UINib(nibName: "ProfileDetailsCell", bundle: nil)
        
        self.tableView.registerNib(detailsCell, forCellReuseIdentifier: "detailsCell")
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .None
    }
    
}
