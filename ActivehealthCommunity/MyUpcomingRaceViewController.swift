//
//  MyUpcomingRaceViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/2/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class MyUpcomingRaceViewController: UIViewController {

    @IBOutlet var secsTimer: ProgressView!
    @IBOutlet var minsTimer: ProgressView!
    @IBOutlet var hrsTimer: ProgressView!
    @IBOutlet var daysTimer: ProgressView!
    
    var viewsDidAppear = false
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        print("sec timer \(secsTimer.frame)")
        print("mins timer \(minsTimer.frame)")
        print("hrs timer \(hrsTimer.frame)")
        print("days timer \(daysTimer.frame)")

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("views did appear")
        print("sec timer \(secsTimer.frame)")
        print("mins timer \(minsTimer.frame)")
        print("hrs timer \(hrsTimer.frame)")
        print("days timer \(daysTimer.frame)")
        if !viewsDidAppear {
            loadProgressBars()
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewsDidAppear = true
    }
   
    func loadProgressBars() {
        daysTimer.createLabel(UIColor(netHex: 0xFF9310))
        daysTimer.createProgressLayer(UIColor(netHex: 0x0A1D37).cgColor, strokeColor2: UIColor(netHex : 0xFF9310).cgColor, lineWidth: 5.0, lineWidth2: 1.0, lineCap: "")
        daysTimer.animateProgressView(80,progressType: "time")
        
        hrsTimer.createLabel(UIColor(netHex: 0xFF9310))
        hrsTimer.createProgressLayer(UIColor(netHex: 0x0A1D37).cgColor, strokeColor2: UIColor(netHex : 0xFF9310).cgColor, lineWidth: 5.0, lineWidth2: 1.0, lineCap: "")
        hrsTimer.animateProgressView(50,progressType: "time")
        
        minsTimer.createLabel(UIColor(netHex: 0xFF9310))
        minsTimer.createProgressLayer(UIColor(netHex: 0x0A1D37).cgColor, strokeColor2: UIColor(netHex : 0xFF9310).cgColor, lineWidth: 5.0, lineWidth2: 1.0, lineCap: "")
        minsTimer.animateProgressView(20,progressType: "time")
        
        secsTimer.createLabel(UIColor(netHex: 0xFF9310))
        secsTimer.createProgressLayer(UIColor(netHex: 0x0A1D37).cgColor, strokeColor2: UIColor(netHex : 0xFF9310).cgColor, lineWidth: 5.0, lineWidth2: 1.0, lineCap: "")
        secsTimer.animateProgressView(10,progressType: "time")
        
        
    }
}
