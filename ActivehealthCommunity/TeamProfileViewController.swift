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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return 1
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath as NSIndexPath).section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "teamDescriptionCell", for: indexPath) as! AhcTeamDescriptionCell
            
            cell.lblTeamDescriptions.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula"
            cell.lblTeamDescriptions.textColor = UIColor.white
            cell.backgroundColor = UIColor(netHex: 0x0A1D37)
            
            return cell
            
            
        }
        else if (indexPath as NSIndexPath).section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "teamLeaderCell", for: indexPath) as! AhcTeamLeaderCell
            
            return cell
        }
        else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "teamMembersCell", for: indexPath) as! AhcTeamMembersCell
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 0
        
        if (indexPath as NSIndexPath).section == 0 {
            
            height = UITableViewAutomaticDimension
        }
        else if (indexPath as NSIndexPath).section == 1 || (indexPath as NSIndexPath).section == 2 {
            
            height = 200
        }
        
        return height
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        let sectionHeight:CGFloat = 0
        
        if section != 0 {
            
            return 50
        }
        else {
            
        }
        
        return sectionHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let label = LabelWithInsets()
        
        if section == 1 {
            
            label.text = "Team Captain: Jade Lapuz"
            label.frame.size = CGSize()
            label.textColor = UIColor.white
            label.backgroundColor = UIColor(netHex: 0xFF9310)
            
        }
        else if section == 2{
            
            label.text = "Team Members: Lapuz Jade"
            label.frame.size = CGSize()
            label.textColor = UIColor.white
            label.backgroundColor = UIColor(netHex: 0xFF9310)
        }
        else {
            
        }
        
        return label
        
    }
    
    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {
        let percentThreshold:CGFloat = 0.3
        
        // convert y-position to downward pull progress (percentage)
        let translation = sender.translation(in: view)
        let verticalMovement = translation.y / view.bounds.height
        let downwardMovement = fmaxf(Float(verticalMovement), 0.0)
        let downwardMovementPercent = fminf(downwardMovement, 1.0)
        let progress = CGFloat(downwardMovementPercent)
        
        guard let interactor = interactor else { return }
        
        switch sender.state {
        case .began:
            interactor.hasStarted = true
            dismiss(animated: true, completion: nil)
        case .changed:
            interactor.shouldFinish = progress > percentThreshold
            interactor.update(progress)
        case .cancelled:
            interactor.hasStarted = false
            interactor.cancel()
        case .ended:
            interactor.hasStarted = false
            interactor.shouldFinish
                ? interactor.finish()
                : interactor.cancel()
        default:
            break
        }
    }
    
    @IBAction func status(_ sender: AnyObject) {
        
        let statusAlertController = storyboard!.instantiateViewController(withIdentifier: "statusAlertController") as! StatusViewController
        statusAlertController.modalPresentationStyle = UIModalPresentationStyle.popover
        statusAlertController.preferredContentSize = CGSize(width: 200, height: statusAlertController.sportsList.count * 58)
        let popOver = statusAlertController.popoverPresentationController
        popOver?.delegate = self
        popOver?.sourceView = self.view
        popOver?.sourceRect = CGRect(x: (self.navBar.frame.origin.x) + 370, y: (self.navBar.frame.origin.y) + 20, width: 10, height: 10)
        self.present(statusAlertController, animated: true, completion: nil)
    }
    
    
    @IBAction func sleepTimer(_ sender: AnyObject) {
    }
    
    func loadNibs(){
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let ahcTeamDescriptionCell = UINib(nibName: "AhcTeamDescriptionCell", bundle: nil)
        let ahcTeamLeaderCell = UINib(nibName: "AhcTeamLeaderCell", bundle: nil)
        let ahcTeamMembersCell = UINib(nibName: "AhcTeamMembersCell", bundle: nil)
        
        self.tableView.register(ahcTeamDescriptionCell, forCellReuseIdentifier: "teamDescriptionCell")
        self.tableView.register(ahcTeamLeaderCell, forCellReuseIdentifier: "teamLeaderCell")
        self.tableView.register(ahcTeamMembersCell, forCellReuseIdentifier: "teamMembersCell")
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
    
}
