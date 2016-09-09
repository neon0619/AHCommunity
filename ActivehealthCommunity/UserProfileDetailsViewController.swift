//
//  UserProfileDetailsViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 9/1/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit
import Eureka

class UserProfileDetailsViewController: FormViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++
            Section("Currently")
            
            <<< TextRow(){
                
                $0.value = "Biking"
            }
            
            +++ Section("Personal Info")                { section in
                var header = HeaderFooterView<ProfileHeaderView>(HeaderFooterProvider.NibFile(name: "ProfileHeaderView", bundle: nil))
                header.height = {50}
                
                header.onSetupView = { view, _ in
                    //                    view.backgroundColor = .redColor()
                }
                section.header = header
            }

            
            <<< EmailRow(){
                
                $0.title = "Email"
                $0.value = "email@sample.com"
            }
            
            <<< AlertRow<String> {
                
                $0.title = "Gender"
                $0.selectorTitle = "Gender"
                $0.options = ["Male", "Female"]
                $0.value = "Male"
                
            }.onChange({ (row) in
                print(row.value)
            }).onPresent({ (_, to) in
                
                to.view.tintColor = UIColor.blueColor()
            })
            
            <<< IntRow() {
                
                $0.title = "Age"
                $0.value = 20
            }
        
            <<< TextRow() {
                
                $0.title = "Location"
                $0.value = "Pampanga"
            }
        
            <<< TextRow() {
                
                $0.title = "Sports"
                $0.value = "Run"
            }
        
            <<< TextRow() {
                
                $0.title = "Team"
                
        }
        
        
        
    }
}
