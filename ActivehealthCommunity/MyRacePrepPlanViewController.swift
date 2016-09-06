//
//  MyRacePrepPlanViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/24/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class MyRacePrepPlanViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("racePlanCell", forIndexPath: indexPath) as! RacePrepPlanCell
        
        cell.lblTitle.text = "Run United \(indexPath.row + 1)"
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toRacePlan", sender: self)
    }
    
    @IBAction func status(sender: AnyObject) {
        
        let statusAlertController = storyboard!.instantiateViewControllerWithIdentifier("statusAlertController") as! StatusViewController
        statusAlertController.modalPresentationStyle = UIModalPresentationStyle.Popover
        statusAlertController.preferredContentSize = CGSize(width: 200, height: statusAlertController.sportsList.count * 58)
        let popOver = statusAlertController.popoverPresentationController
        popOver?.delegate = self
        popOver?.sourceView = self.view
        popOver?.sourceRect = CGRect(x: (self.navigationController?.navigationBar.frame.origin.x)! + 370, y: (self.navigationController?.navigationBar.frame.origin.y)! + 20, width: 10, height: 10)
        self.presentViewController(statusAlertController, animated: true, completion: nil)
        
    }
    
    @IBAction func sleepTimer(sender: AnyObject) {
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .None
    }
}
