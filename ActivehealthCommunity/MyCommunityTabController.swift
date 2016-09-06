//
//  MyCommunityTabController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/3/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class MyCommunityTabController: UIViewController, UITabBarDelegate, UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate, CommunityAlertDelegate{
    
    
    @IBOutlet var tabBar: UITabBar!
    @IBOutlet var tab2: UITabBarItem!
    @IBOutlet var tab1: UITabBarItem!
    @IBOutlet var tab4: UITabBarItem!
    @IBOutlet var tab3: UITabBarItem!
    
    var viewController1: UIViewController?
    var viewController2: UIViewController?
    var viewController3: UIViewController?
    var viewController4: UIViewController?
    
    var currentController: UIViewController?
    
    var communityAlertController = CommunityAlertController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.delegate = self
        loadFirstab()
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem) {
        
        switch item.tag {
            
        case 1:
            
            if viewController1 == nil {
                
                viewController1 = storyboard!.instantiateViewControllerWithIdentifier("communityController") as! CommunityTabItemViewController
                
            }
            self.title = "My Community"
            self.view.insertSubview(viewController1!.view!, belowSubview: self.tabBar)
            break
        case 2:
            
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            
            if viewController2 == nil {
                
                viewController2 = storyboard!.instantiateViewControllerWithIdentifier("classesController") as! ClassesTabItemViewController
                
            }
            self.title = "Classes"
            self.view.insertSubview(viewController2!.view!, belowSubview: self.tabBar)
            break
        case 3:
            
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            
            if viewController3 == nil {
                
                viewController3 = storyboard!.instantiateViewControllerWithIdentifier("featuredStoryController") as! FeaturedStoryTabItemViewController
                
            }
            self.title = "Featured Story"
            self.view.insertSubview(viewController3!.view!, belowSubview: self.tabBar)
            break
        case 4:
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            
            if viewController4 == nil {
                
                viewController4 = storyboard!.instantiateViewControllerWithIdentifier("featuredVideoController") as! FeaturedVideoTabItemViewController
                
            }
            self.title = "Featured Video"
            self.view.insertSubview(viewController4!.view!, belowSubview: self.tabBar)
            break
        default:
            break
            
        }
        
        switch item.title! {
        case "My Community":
            communityAlertController = storyboard!.instantiateViewControllerWithIdentifier("alertView") as! CommunityAlertController
            communityAlertController.modalPresentationStyle = UIModalPresentationStyle.Popover
            communityAlertController.preferredContentSize = CGSize(width: 200, height: 150)
            let popOver = communityAlertController.popoverPresentationController
            popOver?.delegate = self
            popOver?.sourceView = self.view
            popOver?.sourceRect = CGRect(x: tabBar.frame.origin.x - 23, y: tabBar.frame.origin.y - 80, width: 10, height: 10)
            communityAlertController.delegate = self
            self.presentViewController(communityAlertController, animated: true, completion: nil)
            break;
        default:
            break;
        }
    }
    
    func optionSelected(index: Int) {
        print("int \(index)")
        switch index {
        case 0:
            let ahcTeam = storyboard?.instantiateViewControllerWithIdentifier("ahcTeamController") as! AhcTeamViewController
            ahcTeam.view.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.maxY)!, self.view.frame.width, self.view.frame.height - 137)
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            presentController(ahcTeam)
        case 1:
            let ahcCoaches = storyboard?.instantiateViewControllerWithIdentifier("ahcCoachController") as! AhcCoachesViewController
            ahcCoaches.view.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.maxY)!, self.view.frame.width, self.view.frame.height - 137)
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            presentController(ahcCoaches)
        case 2:
            let ahcMentors = storyboard?.instantiateViewControllerWithIdentifier("ahcMentorController") as! AhcMentorsViewController
            ahcMentors.view.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.maxY)!, self.view.frame.width, self.view.frame.height - 137)
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            presentController(ahcMentors)        default:
            break
        }
    }
    
    func presentController(controller: UIViewController) {
        UIView.transitionWithView(self.view, duration: 0.5, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.addChildViewController(controller)
            self.view.addSubview(controller.view)
            controller.didMoveToParentViewController(self)
            self.currentController = controller
            }, completion: { (completed) in
                self.presentedViewController!.dismissViewControllerAnimated(true, completion: nil)
        })
    }
    
    func  removeController(controller:UIViewController) {
        controller.willMoveToParentViewController(nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
    func loadFirstab(){
        tabBar.selectedItem = tab1
        if viewController1 == nil {
            
            viewController1 = storyboard!.instantiateViewControllerWithIdentifier("communityController") as! CommunityTabItemViewController
            
            self.title = "My Community"
        }
        self.view.insertSubview(viewController1!.view!, belowSubview: self.tabBar)
    }
    
    func optionSelected(options: Options) {
        
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
