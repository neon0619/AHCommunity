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

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "featuredVideoCell", for: indexPath) as! FeaturedVideoCell
        let urlString = ytLinks[(indexPath as NSIndexPath).row].ytLink!
        let urlWithSettings = "<iframe width=\"\(cell.frame.width)\" height=\"\(cell.frame.height - 50)\" src=\"\(urlString)?&playsinline=1\" frameborder=\"0\" allowfullscreen></iframe>"
        
        cell.lblDesc.text = ytLinks[(indexPath as NSIndexPath).row].description
        cell.videoPlayer.allowsInlineMediaPlayback = true
        cell.videoPlayer.loadHTMLString(urlWithSettings, baseURL: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
    }
    
    func registerNibs(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let videoCell = UINib(nibName: "FeaturedVideoCell", bundle: nil)
        
        tableView.register(videoCell, forCellReuseIdentifier: "featuredVideoCell")
    
    
    }
}
