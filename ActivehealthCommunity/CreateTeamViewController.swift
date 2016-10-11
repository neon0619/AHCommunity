//
//  CreateTeamViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 10/7/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class CreateTeamViewController: UIViewController {

    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var btnSubmit: UIButton!
    @IBOutlet var txtTeamDescription: UITextView!
    @IBOutlet var txtTeamName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        btnSubmit.backgroundColor = UIColor.green
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    }


    @IBAction func unwindToViewController (_ sender: UIStoryboardSegue){
        //        txtUserType.enabled = true
        
    }
}
