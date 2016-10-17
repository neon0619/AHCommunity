//
//  SignUpViewController.swift
//  ActivehealthCommunity
//
//  Created by Jade on 12/10/2016.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        let url = URL(string: "http://www.activehealth.ph/activehealth-community-home/")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }

    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}
