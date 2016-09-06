//
//  TrainingViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/24/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNibs()
        // Do any additional setup after loading the view.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("sleepCell", forIndexPath: indexPath) as! SleepCell
        
        cell.lblDescription.text = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim."
        cell.ImageView.image = UIImage(named: "placeholder4")
        cell.btnReadMore.backgroundColor = UIColor(netHex: 0xFF9310)
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 300
    }
    
    func loadNibs() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let NutritionCell = UINib(nibName: "SleepCell", bundle: nil)
        
        self.tableView.registerNib(NutritionCell, forCellReuseIdentifier: "sleepCell")
    }
    
    
    
    
}
