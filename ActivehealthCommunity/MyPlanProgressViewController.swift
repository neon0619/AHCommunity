//
//  MyPlanProgressViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/1/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class MyPlanProgressViewController: UIViewController {

    @IBOutlet var progressView: ProgressView!
    var viewsDidAppear = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
       
        if !viewsDidAppear {
            progressView.createLabel(.whiteColor())
            progressView.createProgressLayer(UIColor(netHex: 0xFF9310).CGColor, strokeColor2: UIColor(netHex: 0xFFFFFF).CGColor, lineWidth: 10.0, lineWidth2: 10.0,lineCap: kCALineCapRound)
            progressView.animateProgressView(80,progressType: "percentage")
        }
    }
    
    override func viewDidDisappear(animated: Bool) {
        viewsDidAppear = true
    }
    

    

}
