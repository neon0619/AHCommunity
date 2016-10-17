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
    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var btnLogin: UIButton!
    @IBOutlet weak var btnSignUp: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(endEditing(_:)))
        self.view.addGestureRecognizer(tapGesture)
        setUpViews()
    }
    
    
    
    func setUpViews() {
        btnLogin.backgroundColor = UIColor(netHex: 0xFF9310)
        
        btnSignUp.titleLabel?.numberOfLines = 1
        btnSignUp.titleLabel?.adjustsFontSizeToFitWidth = true
        btnSignUp.titleLabel?.lineBreakMode = .byClipping
        
    }
    
    func endEditing(_ sender: UITapGestureRecognizer){
        
        self.view.endEditing(true)
    }
    
    func keyboardWillShow(_ notification: Notification) {
        if UIDevice.current.modelName == "iPhone 5" || UIDevice.current.modelName == "iPhone 5c" || UIDevice.current.modelName == "iPhone 5s" || UIDevice.current.modelName == "Simulator" {
            
            print("keyboard shown")
            topIconConstraint.constant -= 100
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        if UIDevice.current.modelName == "iPhone 5" || UIDevice.current.modelName == "iPhone 5c" || UIDevice.current.modelName == "iPhone 5s" || UIDevice.current.modelName == "Simulator" {
    
            print("keyboard hidden")
            topIconConstraint.constant += 100
            
        }
    }
    
 
    @IBAction func login(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toMain", sender: nil)
    }
    
    @IBAction func forgotPassword(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toForgotPassword", sender: nil)
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toSignUp", sender: nil)
    }
    
}

