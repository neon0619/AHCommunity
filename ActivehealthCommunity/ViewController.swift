//
//  ViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 7/26/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var topIconConstraint: NSLayoutConstraint!
    @IBOutlet var widgetsStackView: UIStackView!
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

        setUpViews()
    }

  
    
    func setUpViews() {
        btnLogin.backgroundColor = UIColor(netHex: 0xFF9310)
        
              
    }

    func keyboardWillShow(_ notification: Notification) {
        
        if UIDevice.current.modelName == "iPhone 5" || UIDevice.current.modelName == "iPhone 5c" || UIDevice.current.modelName == "iPhone 5s" {
            
            topIconConstraint.constant -= 20
            
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        
        
        if UIDevice.current.modelName == "iPhone 5" || UIDevice.current.modelName == "iPhone 5c" || UIDevice.current.modelName == "iPhone 5s" {
            
            topIconConstraint.constant += 20
            
        }

        
    }


}

