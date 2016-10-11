//
//  MentorSessionTabItemViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 10/7/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

protocol MentorSessionDelegate {
    func joinMentorSession()
}
class MentorSessionTabItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var delegate: MentorSessionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mentorSessions", for: indexPath) as! MentorSessionsCell
        
        cell.btnJoin.backgroundColor = UIColor(netHex: 0xFF9310)
        cell.btnJoin.tag = (indexPath as NSIndexPath).row
        cell.btnJoin.addTarget(self, action: #selector(MentorSessionTabItemViewController.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 400
    }
    
    
    func buttonClicked(_ sender: UIButton) {
        
        let buttonRow = sender.tag
        //        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        //        let vc = storyboard.instantiateViewControllerWithIdentifier("teamProfileController") as! TeamProfileViewController
        //        showViewController(vc, sender: nil)
//        performSegue(withIdentifier: "toTrainingClass", sender: self)
        delegate?.joinMentorSession()
        print("clicked")
        switch buttonRow {
        case 0:
            
            break
        default:
            break
        }

        
    }
    
    
}
