//
//  StatusViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/24/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    let sportsList: Array<Sports> = [Sports(sportName: "Badminton",imageSport: UIImage(named: "badminton")!),
                                     Sports(sportName: "Basketball",imageSport: UIImage(named: "basketball")!),
                                     Sports(sportName: "Biking",imageSport: UIImage(named: "biking")!),
                                     Sports(sportName: "Resting",imageSport: UIImage(named: "resting")!),
                                     Sports(sportName: "Running",imageSport: UIImage(named: "running")!),
                                     Sports(sportName: "Soccer",imageSport: UIImage(named: "soccer")!),
                                     Sports(sportName: "Swimming",imageSport: UIImage(named: "swimming")!),
                                     Sports(sportName: "Volleyball",imageSport: UIImage(named: "volleyball")!),
                                     Sports(sportName: "Working",imageSport: UIImage(named: "working")!),
                                     Sports(sportName: "Workout",imageSport: UIImage(named: "workout")!)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
   
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sportsList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("statusCell", forIndexPath: indexPath) as! StatusCell
        
        cell.imageSport.image = sportsList[indexPath.row].imageSport
        cell.lblSportName.text = sportsList[indexPath.row].sportName
        
        return cell
    }
   
}
