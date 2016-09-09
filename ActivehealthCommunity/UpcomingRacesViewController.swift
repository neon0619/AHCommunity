//
//  UpcomingRacesViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 9/7/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class UpcomingRacesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       loadNibs()
        
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("myUpcomingRaceCell", forIndexPath: indexPath) as! MyUpcomingRaceCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 320
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        
            label.text = "My Upcoming Races"
            label.frame.size = CGSize()
            label.textAlignment = .Center
            label.textColor = UIColor.whiteColor()
            label.backgroundColor = UIColor(netHex: 0xFF9310)
        
        return label
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }

    
    func loadNibs(){
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let upcomingRacesNib = UINib(nibName: "MyUpcomingRacellCell", bundle: nil)
        
        self.tableView.registerNib(upcomingRacesNib, forCellReuseIdentifier: "myUpcomingRaceCell")
    }
}
