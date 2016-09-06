//
//  TeamProfileViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/5/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class TeamProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate {
    
    var interactor:Interactor? = nil
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer
        loadNibs()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return 1
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("teamDescriptionCell", forIndexPath: indexPath) as! AhcTeamDescriptionCell
            
            cell.lblTeamDescriptions.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula"
            cell.lblTeamDescriptions.textColor = UIColor.whiteColor()
            cell.backgroundColor = UIColor(netHex: 0x0A1D37)
            
            return cell
            
            
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("teamLeaderCell", forIndexPath: indexPath) as! AhcTeamLeaderCell
            
            return cell
        }
        else  {
            let cell = tableView.dequeueReusableCellWithIdentifier("teamMembersCell", forIndexPath: indexPath) as! AhcTeamMembersCell
            
            return cell
        }
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat = 0
        
        if indexPath.section == 0 {
            
            height = UITableViewAutomaticDimension
        }
        else if indexPath.section == 1 || indexPath.section == 2 {
            
            height = 200
        }
        
        return height
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let sectionHeight:CGFloat = 0
        
        if section != 0 {
            
            return 50
        }
        else {
            
        }
        
        return sectionHeight
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
          let label = LabelWithInsets()
        
        if section == 1 {
          
            label.text = "Team Captain: Jade Lapuz"
            label.frame.size = CGSize()
            label.textColor = UIColor.whiteColor()
            label.backgroundColor = UIColor(netHex: 0xFF9310)
            
        }
        else if section == 2{
            label.text = "Team Members: Lapuz Jade"
            label.frame.size = CGSize()
            label.textColor = UIColor.whiteColor()
            label.backgroundColor = UIColor(netHex: 0xFF9310)
            
        }
        else {
            
        }
        
        return label
        
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
    
    func loadNibs(){
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let ahcTeamDescriptionCell = UINib(nibName: "AhcTeamDescriptionCell", bundle: nil)
        let ahcTeamLeaderCell = UINib(nibName: "AhcTeamLeaderCell", bundle: nil)
        let ahcTeamMembersCell = UINib(nibName: "AhcTeamMembersCell", bundle: nil)
        
        self.tableView.registerNib(ahcTeamDescriptionCell, forCellReuseIdentifier: "teamDescriptionCell")
        self.tableView.registerNib(ahcTeamLeaderCell, forCellReuseIdentifier: "teamLeaderCell")
        self.tableView.registerNib(ahcTeamMembersCell, forCellReuseIdentifier: "teamMembersCell")
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .None
    }
    
}
