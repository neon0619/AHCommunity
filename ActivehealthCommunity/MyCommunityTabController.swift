//
//  MyCommunityTabController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/3/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class MyCommunityTabController: UIViewController, UITabBarDelegate, UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate, CommunityAlertDelegate, MentorSessionDelegate{
    
    
    @IBOutlet var tabBar: UITabBar!
    @IBOutlet var tab2: UITabBarItem!
    @IBOutlet var tab1: UITabBarItem!
    @IBOutlet var tab4: UITabBarItem!
    @IBOutlet var tab3: UITabBarItem!
    
    var viewController1: UIViewController?
    var viewController2: UIViewController?
    var viewController3: UIViewController?
    var viewController4: UIViewController?
    var viewController5: MentorSessionTabItemViewController?
    
    var currentController: UIViewController?
    
    var communityAlertController = CommunityAlertController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.delegate = self
        loadFirstab()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        switch item.tag {
            
        case 1:
            
            if viewController1 == nil {
                
                viewController1 = storyboard!.instantiateViewController(withIdentifier: "communityController") as! CommunityTabItemViewController
                
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
                
                viewController2 = storyboard!.instantiateViewController(withIdentifier: "classesController") as! ClassesTabItemViewController
                
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
                
                viewController3 = storyboard!.instantiateViewController(withIdentifier: "featuredStoryController") as! FeaturedStoryTabItemViewController
                
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
                
                viewController4 = storyboard!.instantiateViewController(withIdentifier: "featuredVideoController") as! FeaturedVideoTabItemViewController
                
            }
            self.title = "Featured Video"
            self.view.insertSubview(viewController4!.view!, belowSubview: self.tabBar)
            break
        case 5:
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            
            if viewController5 == nil {
                
                viewController5 = storyboard!.instantiateViewController(withIdentifier: "mentorSessionsController") as! MentorSessionTabItemViewController
                viewController5?.delegate = self
                
            }
            self.title = "Mentor Sessions"
            self.view.insertSubview(viewController5!.view!, belowSubview: self.tabBar)
            break

        default:
            break
            
        }
        
        switch item.title! {
        case "My Community":
            communityAlertController = storyboard!.instantiateViewController(withIdentifier: "alertView") as! CommunityAlertController
            communityAlertController.modalPresentationStyle = UIModalPresentationStyle.popover
            communityAlertController.preferredContentSize = CGSize(width: 200, height: 180)
            let popOver = communityAlertController.popoverPresentationController
            popOver?.delegate = self
            popOver?.sourceView = self.view
            popOver?.sourceRect = CGRect(x: tabBar.frame.origin.x - 23, y: tabBar.frame.origin.y - 80, width: 10, height: 10)
            communityAlertController.delegate = self
            self.present(communityAlertController, animated: true, completion: nil)
            break;
        default:
            break;
        }
    }
    
    func optionSelected(_ index: Int) {
        print("int \(index)")
        switch index {
        case 0:
            let ahcTeam = storyboard?.instantiateViewController(withIdentifier: "ahcTeamController") as! AhcTeamViewController
            ahcTeam.view.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: self.view.frame.width, height: self.view.frame.height - 110)
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            presentController(ahcTeam)
        case 1:
            let ahcCoaches = storyboard?.instantiateViewController(withIdentifier: "ahcCoachController") as! AhcCoachesViewController
            ahcCoaches.view.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: self.view.frame.width, height: self.view.frame.height - 110)
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            presentController(ahcCoaches)
        case 2:
            let ahcMentors = storyboard?.instantiateViewController(withIdentifier: "ahcMentorController") as! AhcMentorsViewController
            ahcMentors.view.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: self.view.frame.width, height: self.view.frame.height - 110)
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            presentController(ahcMentors)
        case 3:
            let ahcMentors = storyboard?.instantiateViewController(withIdentifier: "ahcExpertController") as! AhcExpertViewController
            ahcMentors.view.frame = CGRect(x: 0, y: (self.navigationController?.navigationBar.frame.maxY)!, width: self.view.frame.width, height: self.view.frame.height - 110)
            if currentController != nil {
                removeController(currentController!)
                currentController = nil
            }
            presentController(ahcMentors)
            break
        default:
            break
        }
    }
    
    func presentController(_ controller: UIViewController) {
        UIView.transition(with: self.view, duration: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.addChildViewController(controller)
            self.view.addSubview(controller.view)
            controller.didMove(toParentViewController: self)
            self.currentController = controller
            }, completion: { (completed) in
                self.presentedViewController!.dismiss(animated: true, completion: nil)
        })
    }
    
    func  removeController(_ controller:UIViewController) {
        controller.willMove(toParentViewController: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
    func loadFirstab(){
        tabBar.selectedItem = tab1
        if viewController1 == nil {
            
            viewController1 = storyboard!.instantiateViewController(withIdentifier: "communityController") as! CommunityTabItemViewController
            
            self.title = "My Community"
        }
        self.view.insertSubview(viewController1!.view!, belowSubview: self.tabBar)
    }
    
    func optionSelected(_ options: Options) {
        
        
    }
    
    func joinMentorSession() {
        
        DispatchQueue.main.async {
            
            self.performSegue(withIdentifier: "toJoinSession", sender: nil)
        }
    }
    
    
    @IBAction func status(_ sender: AnyObject) {
        
        let statusAlertController = storyboard!.instantiateViewController(withIdentifier: "statusAlertController") as! StatusViewController
        statusAlertController.modalPresentationStyle = UIModalPresentationStyle.popover
        statusAlertController.preferredContentSize = CGSize(width: 200, height: statusAlertController.sportsList.count * 58)
        let popOver = statusAlertController.popoverPresentationController
        popOver?.delegate = self
        popOver?.sourceView = self.view
        popOver?.sourceRect = CGRect(x: (self.navigationController?.navigationBar.frame.origin.x)! + 370, y: (self.navigationController?.navigationBar.frame.origin.y)! + 20, width: 10, height: 10)
        self.present(statusAlertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func sleepTimer(_ sender: AnyObject) {
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
    
    
}
