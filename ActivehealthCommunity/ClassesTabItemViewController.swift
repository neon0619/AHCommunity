//
//  ClassesTabItemViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/3/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class ClassesTabItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cellItems: Array<Classes> = []

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
        
        let cell = tableView.dequeueReusableCellWithIdentifier("classesCell", forIndexPath: indexPath) as! ClassesCell
        
        cell.lblTitle.text = "Class Training Triathlon"
        cell.lblDate.text = "February 27-28 2016"
        cell.lblVenue.text = "Philippines"
        cell.lblFee.text = "P150"
        cell.coverImage.image = UIImage(named: "placeholder8")
        
        cell.btnJoin.backgroundColor = UIColor(netHex: 0xFF9310)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 300
    }
    
    func loadNibs() {
        
        let classCell = UINib(nibName: "ClassesCell", bundle: nil)
        
        self.tableView.registerNib(classCell, forCellReuseIdentifier: "classesCell")
    }
    
    
}
