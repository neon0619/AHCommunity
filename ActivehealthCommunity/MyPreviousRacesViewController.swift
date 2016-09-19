//
//  MyPreviousRacesViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 9/7/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class MyPreviousRacesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myPreviousRacesCell", for: indexPath) as! MyPreviousRacesCell
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        
        label.text = "My Previous Races"
        label.frame.size = CGSize()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.backgroundColor = UIColor(netHex: 0xFF9310)
        
        return label
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 50
    }
}
