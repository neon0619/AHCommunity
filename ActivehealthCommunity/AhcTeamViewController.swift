//
//  AhcTeamViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/5/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class AhcTeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIViewControllerTransitioningDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var btnCreateTeam: UIButton!
    let interactor = Interactor()
    
    override func viewDidLoad() {
        
        registerNibs()
        
        tableView.separatorStyle = .none
        
        btnCreateTeam.backgroundColor = UIColor.green
        btnCreateTeam.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 100)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ahcTeamCell", for: indexPath) as! AhcTeamCell
        
        cell.teamName.text = "Team: Hakuna Matata"
        cell.teamMembers.text = "Members: 10"
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
        performSegue(withIdentifier: "toTeamProfileController", sender: self)
        
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
        
        let ahcCell = UINib(nibName: "AhcTeamCell", bundle: nil)
        
        self.tableView.register(ahcCell, forCellReuseIdentifier: "ahcTeamCell")
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue!")
        if let destinationViewController = segue.destination as? TeamProfileViewController {
            destinationViewController.transitioningDelegate = self
            destinationViewController.interactor = interactor // new
        }
    }
    

    @IBAction func createTeam(_ sender: AnyObject) {
        
        DispatchQueue.main.async {
            
            self.performSegue(withIdentifier: "toTeamForm", sender: nil)
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
