//
//  AhcMentorsViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/24/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class AhcMentorsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    let interactor = Interactor()
    
    override func viewDidLoad() {
        
        registerNibs()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ahcCell", forIndexPath: indexPath) as! AhcCell
        
        cell.lbldesc.text = "Lebron James"
        cell.img.image = UIImage(named: "placeholder2")
        cell.btnView.backgroundColor = UIColor(netHex: 0xFF9310)
        
        cell.btnView.tag = indexPath.row
        cell.btnView.addTarget(self, action: #selector(AhcTeamViewController.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 300
    }
    
    
    func buttonClicked(sender: UIButton) {
        let buttonRow = sender.tag
        //        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        //        let vc = storyboard.instantiateViewControllerWithIdentifier("teamProfileController") as! TeamProfileViewController
        //        showViewController(vc, sender: nil)
        performSegueWithIdentifier("toMentorsController", sender: self)
        switch buttonRow {
        case 0:
            
            break
        default:
            break
        }
        
        
    }
    func registerNibs(){
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let ahcCell = UINib(nibName: "AhcCell", bundle: nil)
        
        self.tableView.registerNib(ahcCell, forCellReuseIdentifier: "ahcCell")
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("segue!")
        if let destinationViewController = segue.destinationViewController as? MentorsViewController {
            destinationViewController.transitioningDelegate = self
            destinationViewController.interactor = interactor // new
        }
    }
    
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        //        txtUserType.enabled = true
        
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    
    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}
