//
//  MainViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 7/26/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

@objc
protocol MainViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}



class MainViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource, UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate {
    
    var delegate: MainViewControllerDelegate?
    
    // The custom UIPageControl
    @IBOutlet weak var pageControl: UIPageControl!
    
    // The UIPageViewController
    var pageContainer: UIPageViewController!
    
    // The pages it contains
    var pages = [UIViewController]()
    
    // Track the current index
    var currentIndex: Int?
    var currentController: UIViewController?
    
    private var pendingIndex: Int?
    
    
    
    override func viewDidLoad() {
               
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let page1: UIViewController! = storyboard.instantiateViewControllerWithIdentifier("ahcPointsController")
        let page2: UIViewController! = storyboard.instantiateViewControllerWithIdentifier("myPlanProgressController")
        let page3: UIViewController! = storyboard.instantiateViewControllerWithIdentifier("myUpcomingRaceController")
        let page4: UIViewController! = storyboard.instantiateViewControllerWithIdentifier("communityPollsController")
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        pageContainer = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        pageContainer.delegate = self
        pageContainer.dataSource = self
        pageContainer.setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        // Add it to the view
        view.addSubview(pageContainer.view)
        
        // Configure our custom pageControl
        view.bringSubviewToFront(pageControl)
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
        
    }
    
    @IBAction func openSlider(sender: AnyObject) {
        
        delegate?.toggleLeftPanel!()
    }
    
//    func optionSelected(option: Menu) {
//        switch option.title {
//        case "Home":
//            if currentController != nil {
//                currentController!.willMoveToParentViewController(nil)
//                currentController!.view.removeFromSuperview()
//                currentController!.removeFromParentViewController()
//                self.navigationItem.title = "Active Health"
//            }
//            break
//        case "My Community":
//            let centerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("tabBar") as! MyCommunityTabController
////            showViewController(<#T##vc: UIViewController##UIViewController#>, sender: <#T##AnyObject?#>)
//            
//            presentController("My Community", controller: centerViewController)
//            break
//        default:
//            break
//        }
//        delegate?.collapseSidePanels!()
//    }
    
//    func presentController(title: String, controller : UIViewController) {
//        self.navigationItem.title = title
//        if currentController != controller {
//            if currentController != nil {
//                currentController!.willMoveToParentViewController(nil)
//                currentController!.view.removeFromSuperview()
//                currentController!.removeFromParentViewController()
//            }
//            // controller.willMoveToParentViewController(self)
//            self.addChildViewController(controller)
//            self.view.addSubview(controller.view)
//            controller.didMoveToParentViewController(self)
//            currentController = controller
//        }
//    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = pages.indexOf(viewController)!
        if currentIndex == 0 {
            return nil
        }
        let previousIndex = abs((currentIndex - 1) % pages.count)
        return pages[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = pages.indexOf(viewController)!
        if currentIndex == pages.count-1 {
            return nil
        }
        let nextIndex = abs((currentIndex + 1) % pages.count)
        return pages[nextIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
        
        pendingIndex = pages.indexOf(pendingViewControllers.first!)
    }
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            
            currentIndex = pendingIndex
            if let index = currentIndex {
                pageControl.currentPage = index
            }
        }
    }
    
    @IBAction func sleepTimer(sender: AnyObject) {
        
     
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
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return pages.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        
        return 0
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .None
    }
    
    
    
}
