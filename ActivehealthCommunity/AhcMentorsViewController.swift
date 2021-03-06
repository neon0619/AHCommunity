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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ahcCell", for: indexPath) as! AhcCell
        
        cell.lbldesc.text = "Lebron James"
        cell.img.image = UIImage(named: "placeholder2")
        cell.btnView.backgroundColor = UIColor(netHex: 0xFF9310)
        
        cell.btnView.tag = (indexPath as NSIndexPath).row
        cell.btnView.addTarget(self, action: #selector(AhcTeamViewController.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
    
    
    func buttonClicked(_ sender: UIButton) {
        let buttonRow = sender.tag
        //        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        //        let vc = storyboard.instantiateViewControllerWithIdentifier("teamProfileController") as! TeamProfileViewController
        //        showViewController(vc, sender: nil)
        performSegue(withIdentifier: "toMentorsController", sender: self)
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
        
        self.tableView.register(ahcCell, forCellReuseIdentifier: "ahcCell")
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue!")
        if let destinationViewController = segue.destination as? MentorsViewController {
            destinationViewController.transitioningDelegate = self
            destinationViewController.interactor = interactor // new
        }
    }
    
    
    @IBAction func unwindToViewController (_ sender: UIStoryboardSegue){
        //        txtUserType.enabled = true
        
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}
