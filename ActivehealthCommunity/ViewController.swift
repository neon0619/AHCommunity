//
//  ViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 7/26/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var widgetsStackView: UIStackView!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpViews() {
        btnLogin.backgroundColor = UIColor(netHex: 0xFF9310)
        
              
    }


}

