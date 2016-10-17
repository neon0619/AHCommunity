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
    @objc optional func toggleLeftPanel()
    @objc optional func collapseSidePanels()
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
    
    fileprivate var pendingIndex: Int?
    
    
    
    override func viewDidLoad() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let page1: UIViewController! = storyboard.instantiateViewController(withIdentifier: "myPlanProgressController")
        let page2: UIViewController! = storyboard.instantiateViewController(withIdentifier: "ahcPointsController")
        let page3: UIViewController! = storyboard.instantiateViewController(withIdentifier: "myUpcomingRaceController")
        let page4: UIViewController! = storyboard.instantiateViewController(withIdentifier: "communityPollsController")
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        pages.append(page4)
        
        
        pageContainer = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageContainer.delegate = self
        pageContainer.dataSource = self
        pageContainer.setViewControllers([page1], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        
        // Add it to the view
        view.addSubview(pageContainer.view)
        
        // Configure our custom pageControl
        view.bringSubview(toFront: pageControl)
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = 0
        
        
    }
    
    @IBAction func openSlider(_ sender: AnyObject) {
        
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
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = pages.index(of: viewController)!
        if currentIndex == 0 {
            return nil
        }
        let previousIndex = abs((currentIndex - 1) % pages.count)
        return pages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let currentIndex = pages.index(of: viewController)!
        if currentIndex == pages.count-1 {
            return nil
        }
        let nextIndex = abs((currentIndex + 1) % pages.count)
        return pages[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
        pendingIndex = pages.index(of: pendingViewControllers.first!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            
            currentIndex = pendingIndex
            if let index = currentIndex {
                pageControl.currentPage = index
            }
        }
    }
    
    @IBAction func sleepTimer(_ sender: AnyObject) {
        
     
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
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return pages.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        
        return 0
    }
    
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
    
    
    
}
