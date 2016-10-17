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
        
        progressView.setOuterStrokeColor(color: UIColor(netHex: 0xFF9310).cgColor)
        progressView.setInnerStrokeColor(color: UIColor(netHex: 0xFFFFFF).cgColor)
        progressView.setOuterStrokeLineWidth(width: 10.0)
        progressView.setInnerStrokeLineWidth(width: 10.0)
        progressView.animateProgressView(80,progressType: .percentage)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        progressView.setNeedsDisplay()
        if !viewsDidAppear {
            
            
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewsDidAppear = true
    }
    
    
    
    
}
