//
//  ForgotPasswordViewController.swift
//  ActivehealthCommunity
//
//  Created by Jade on 12/10/2016.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = false
        let url = URL(string: "http://events.activehealth.ph/index.php/customer/account/forgotpassword")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
