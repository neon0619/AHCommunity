//
//  HttpRequests.swift
//  ActivehealthCommunity
//
//  Created by Jade on 15/10/2016.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit
import Alamofire

class HttpRequests {
    
    public func login(params: Parameters) {
        
        Alamofire.request("http://ahcommunity.activehealth.ph/webservice/login_api.php", parameters: params).responseJSON { (responeJson) in
            
            if responeJson.result.isSuccess {
                print("json \(responeJson.result.value!)")
                print(params)
            } else {
                
                print(responeJson.result.error)
            }
        }
    }
}
