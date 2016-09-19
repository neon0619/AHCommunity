//
//  CoachProfileController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/24/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class CoachProfileController : UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate, UIPopoverControllerDelegate {
    
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var tableView: UITableView!
    
     var interactor:Interactor? = nil
    
    let profileDetails: Array<ProfileDetails> = [ProfileDetails(detailsName: "Email", details: "sample@gmail.com"),ProfileDetails(detailsName: "Gender", details: "Female"),ProfileDetails(detailsName: "Age", details: "30"), ProfileDetails(detailsName: "Location", details: "Cubao"), ProfileDetails(detailsName: "Sports", details: "Track and Fields")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNibs()
        
        self.navBar.setBackgroundImage(UIImage(), for: .default)
        self.navBar.shadowImage = UIImage()
        self.navBar.isTranslucent = true

        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return profileDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! ProfileDetailsCell
        
        cell.lblDetailsName.text = profileDetails[(indexPath as NSIndexPath).row].detailsName
        cell.lblDetailsName.textColor = UIColor(netHex: 0xFF9310)
        cell.lblDetails.text = profileDetails[(indexPath as NSIndexPath).row].details
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = CoachHeaderCell.fromNib()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
         return 250
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
         return 64
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
   
    func loadNibs() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let detailsCell = UINib(nibName: "ProfileDetailsCell", bundle: nil)
        
        self.tableView.register(detailsCell, forCellReuseIdentifier: "detailsCell")
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // Return no adaptive presentation style, use default presentation behaviour
        return .none
    }
    
}
