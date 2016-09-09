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
        Video(description: "penatibus et magnis dis parturient montes", ytLink: "https://www.youtube.com/embed/NU9JoFKlaZ0"),
        Video(description: "penatibus et magnis dis parturient montes", ytLink: "https://www.youtube.com/embed/s1tAYmMjLdY"),
        Video(description: "penatibus et magnis dis parturient montes", ytLink: "https://www.youtube.com/embed/s1tAYmMjLdY")
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
        let urlString = ytLinks[indexPath.row].ytLink!
        let urlWithSettings = "<iframe width=\"\(cell.frame.width)\" height=\"\(cell.frame.height - 50)\" src=\"\(urlString)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>"
        
        cell.lblDesc.text = ytLinks[indexPath.row].description
        cell.videoPlayer.allowsInlineMediaPlayback = true
        cell.videoPlayer.loadHTMLString(urlWithSettings, baseURL: nil)
        
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
