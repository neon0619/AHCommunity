//
//  FeaturedVideoTabItemViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/3/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class FeaturedVideoTabItemViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    let ytLinks: Array<Video> = [
        Video(description: "penatibus et magnis dis parturient montes", ytLink: "https://www.youtube.com/watch?v=-AGogYAB-Mg"),
        Video(description: "penatibus et magnis dis parturient montes", ytLink: "https://www.youtube.com/watch?v=XBSnsrHc4NU"),
        Video(description: "penatibus et magnis dis parturient montes", ytLink: "https://www.youtube.com/watch?v=l4vhazet4oo")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNibs()
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("featuredVideoCell", forIndexPath: indexPath) as! FeaturedVideoCell
        let url = NSURL(string: ytLinks[indexPath.row].ytLink! )
        
        cell.lblDesc.text = ytLinks[indexPath.row].description
        cell.playerView.loadVideoURL(url!)
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 200
    }
    
    func registerNibs(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let videoCell = UINib(nibName: "FeaturedVideoCell", bundle: nil)
        
        tableView.registerNib(videoCell, forCellReuseIdentifier: "featuredVideoCell")
    
    
    }
}
