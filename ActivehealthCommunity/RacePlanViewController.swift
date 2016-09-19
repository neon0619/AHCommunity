//
//  RacePlanViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/24/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class RacePlanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate,UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var tabBar: UITabBar!
    
    var viewController1: UIViewController?
    var viewController2: UIViewController?
    var viewController3: UIViewController?
    var viewController4: UIViewController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNibs()
        self.title = "Nutrition"
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "racePlanCell", for: indexPath) as! RacePlanCell
        
        cell.lblDay.text = "Day \((indexPath as NSIndexPath).row + 1)"
        cell.lblDescription.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim."
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cellHeader = tableView.dequeueReusableCell(withIdentifier: "racePlanHeaderCell") as! RacePlanHeaderCellTableViewCell
        
        cellHeader.lblTitle.text = "Run United 1"
        
        return cellHeader
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 75
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 54
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("wat")
        switch item.tag {
            
        case 1:
            
            if viewController1 == nil {
                viewController1 = storyboard!.instantiateViewController(withIdentifier: "nutritionController") as! NutritionViewController
                viewController1?.view.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: (self.view.frame.height - self.tabBar.frame.height) - 60)
                
            }
            self.title = "Nutrition"
            self.view.insertSubview(viewController1!.view!, belowSubview: self.tabBar)
            self.view.bringSubview(toFront: viewController1!.view!)
            break
        case 2:
            
            if viewController2 == nil {
                
                viewController2 = storyboard!.instantiateViewController(withIdentifier: "trainingController") as! TrainingViewController
                viewController2?.view.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: (self.view.frame.height - self.tabBar.frame.height) - 60)
                
            }
            self.title = "Training"
            self.view.insertSubview(viewController2!.view!, belowSubview: self.tabBar)
            self.view.bringSubview(toFront: viewController2!.view!)
            break
        case 3:
            
            
            
            if viewController3 == nil {
                
                viewController3 = storyboard!.instantiateViewController(withIdentifier: "gearController") as! GearViewController
                viewController3?.view.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: (self.view.frame.height - self.tabBar.frame.height) - 60)
            }
            self.title = "Gear"
            self.view.insertSubview(viewController3!.view!, belowSubview: self.tabBar)
            self.view.bringSubview(toFront: viewController3!.view!)
            break
        case 4:
            
            if viewController4 == nil {
                
                viewController4 = storyboard!.instantiateViewController(withIdentifier: "sleepController") as! SleepViewController
                viewController4?.view.frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: (self.view.frame.height - self.tabBar.frame.height) - 60)
            }
            self.title = "Sleep"
            self.view.insertSubview(viewController4!.view!, belowSubview: self.tabBar)
            self.view.bringSubview(toFront: viewController4!.view!)
            break
        default:
            break
            
        }
    }
    
    
    func loadNibs() {
        self.tabBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let racePlanCell = UINib(nibName: "RacePlanCell", bundle: nil)
        let headerCell = UINib(nibName: "RacePlanHeaderCellTableViewCell", bundle: nil)
        
        self.tableView.register(headerCell, forCellReuseIdentifier: "racePlanHeaderCell")
        self.tableView.register(racePlanCell, forCellReuseIdentifier: "racePlanCell")
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
