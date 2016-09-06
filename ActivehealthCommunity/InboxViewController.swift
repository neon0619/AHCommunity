//
//  InboxViewController.swift
//  
//
//  Created by JadeL on 8/24/16.
//
//

import UIKit

class InboxViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("inboxCell", forIndexPath: indexPath) as! InboxCell
        
        cell.lblSubject.text = "Coach Analysis"
        cell.lblSender.text = "Coach Ani De Leon"
        cell.lblDate.text = "01/17/2016"
        cell.btnDelete.backgroundColor = UIColor(netHex: 0x0A1D37)
        cell.btnView.backgroundColor = UIColor(netHex: 0x0A1D37)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 150
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
