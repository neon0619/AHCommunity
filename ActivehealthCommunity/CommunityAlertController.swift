//
//  CommunityAlertController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/4/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

protocol CommunityAlertDelegate {
    func optionSelected(index: Int)
}

class CommunityAlertController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    
    let interactor = Interactor()
    
    var delegate : CommunityAlertDelegate?
    var options : Array<Options> = [Options(title: "AHC TEAM", image: "ahc_team"),Options(title: "AHC COACHES", image: "ahc_coaches"),Options(title: "AHC MENTORS", image: "ahc_mentors")]


    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return options.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CommunityAlertCell
        
        cell.imgIcon.image = UIImage(named: options[indexPath.row].imageName)
        cell.lblTitle.text = options[indexPath.row].title
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        delegate?.optionSelected(indexPath.row)
      
        
        //        switch indexPath.row {
//        case 0:
//            performSegueWithIdentifier("toAhcTeam", sender: self)
//            break
//        case 1:
//            performSegueWithIdentifier("toAhcCoaches", sender: self)
//            break
//        case 2:
//            performSegueWithIdentifier("toAhcMentors", sender: self)
//            break
//        default:
//            break
//        }
        
        
        
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let destinationViewController = segue.destinationViewController as? AhcTeamViewController {
//            destinationViewController.transitioningDelegate = self
//            destinationViewController.interactor = interactor
//        }
//    }
//    
//    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        return DismissAnimator()
//    }
//    
//    func interactionControllerForDismissal(animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
//        return interactor.hasStarted ? interactor : nil
//    }
    
    
}
