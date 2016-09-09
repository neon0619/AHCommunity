//
//  MapAnnotations.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 9/7/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import MapKit

class MapAnnotations: NSObject, MKAnnotation {
    
    let name: String
    let status: String
//    let image:
    let coordinate: CLLocationCoordinate2D
    
    init(name: String, status: String, coordinate: CLLocationCoordinate2D) {
        
        self.name = name
        self.status = status
        self.coordinate = coordinate
    }
}
