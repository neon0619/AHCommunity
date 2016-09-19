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

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "classesCell", for: indexPath) as! ClassesCell
        
        cell.lblTitle.text = "Class Training Triathlon"
        cell.lblDate.text = "February 27-28 2016"
        cell.lblVenue.text = "Philippines"
        cell.lblFee.text = "P150"
        cell.coverImage.image = UIImage(named: "placeholder8")
        
        cell.btnJoin.backgroundColor = UIColor(netHex: 0xFF9310)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 300
    }
    
    func loadNibs() {
        
        let classCell = UINib(nibName: "ClassesCell", bundle: nil)
        
        self.tableView.register(classCell, forCellReuseIdentifier: "classesCell")
    }
    
    
}
