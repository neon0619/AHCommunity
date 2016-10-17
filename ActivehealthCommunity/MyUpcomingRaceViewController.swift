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
        daysTimer.setInnerLabelTextColor(textColor: UIColor(netHex: 0xFF9310))
        daysTimer.setOuterStrokeColor(color: UIColor(netHex: 0x0A1D37).cgColor)
        daysTimer.setInnerLabelTextColor(textColor: UIColor(netHex: 0xFF9310))
        daysTimer.setOuterStrokeLineWidth(width: 5.0)
        daysTimer.setInnerStrokeLineWidth(width: 1.0)
        daysTimer.setLineCap(lineCap: nil)
        daysTimer.animateProgressView(80, progressType: .timer)
        daysTimer.setNeedsDisplay()
        
        hrsTimer.setInnerLabelTextColor(textColor: UIColor(netHex: 0xFF9310))
        hrsTimer.setOuterStrokeColor(color: UIColor(netHex: 0x0A1D37).cgColor)
        hrsTimer.setInnerLabelTextColor(textColor: UIColor(netHex: 0xFF9310))
        hrsTimer.setOuterStrokeLineWidth(width: 5.0)
        hrsTimer.setInnerStrokeLineWidth(width: 1.0)
        hrsTimer.setLineCap(lineCap: nil)
        hrsTimer.animateProgressView(50, progressType: .timer)
        hrsTimer.setNeedsDisplay()
        
        minsTimer.setInnerLabelTextColor(textColor: UIColor(netHex: 0xFF9310))
        minsTimer.setOuterStrokeColor(color: UIColor(netHex: 0x0A1D37).cgColor)
        minsTimer.setInnerLabelTextColor(textColor: UIColor(netHex: 0xFF9310))
        minsTimer.setOuterStrokeLineWidth(width: 5.0)
        minsTimer.setInnerStrokeLineWidth(width: 1.0)
        minsTimer.setLineCap(lineCap: nil)
        minsTimer.animateProgressView(25, progressType: .timer)
        minsTimer.setNeedsDisplay()
        
        secsTimer.setInnerLabelTextColor(textColor: UIColor(netHex: 0xFF9310))
        secsTimer.setOuterStrokeColor(color: UIColor(netHex: 0x0A1D37).cgColor)
        secsTimer.setInnerLabelTextColor(textColor: UIColor(netHex: 0xFF9310))
        secsTimer.setOuterStrokeLineWidth(width: 5.0)
        secsTimer.setInnerStrokeLineWidth(width: 1.0)
        secsTimer.setLineCap(lineCap: nil)
        secsTimer.animateProgressView(10, progressType: .timer)
        secsTimer.starTimer()
        secsTimer.setNeedsDisplay()
        
    }
}
