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

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myUpcomingRaceCell", for: indexPath) as! MyUpcomingRaceCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 320
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        
            label.text = "My Upcoming Races"
            label.frame.size = CGSize()
            label.textAlignment = .center
            label.textColor = UIColor.white
            label.backgroundColor = UIColor(netHex: 0xFF9310)
        
        return label
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }

    
    func loadNibs(){
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let upcomingRacesNib = UINib(nibName: "MyUpcomingRacellCell", bundle: nil)
        
        self.tableView.register(upcomingRacesNib, forCellReuseIdentifier: "myUpcomingRaceCell")
    }
}
