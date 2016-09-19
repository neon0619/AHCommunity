//
//  CommunityTabItemViewController.swift
//  ActivehealthCommunity
//
//  Created by JadeL on 8/3/16.
//  Copyright © 2016 JadeL. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SwiftyJSON

fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l < r
    case (nil, _?):
        return true
    default:
        return false
    }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
    switch (lhs, rhs) {
    case let (l?, r?):
        return l > r
    default:
        return rhs < lhs
    }
}


class CommunityTabItemViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    @IBOutlet var yellowView: UIView!
    @IBOutlet var lblCurrentLocation: UILabel!
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var lblTemperature: UILabel!
    
    let geocoder = CLGeocoder()
    let locationManager = CLLocationManager()
    let locationNames: Array<MapAnnotations> = [
        MapAnnotations(name: "Athlete 1",status: "Resting",coordinate: CLLocationCoordinate2D(latitude: 14.5831, longitude: 120.9794)),
        MapAnnotations(name: "Athlete 2",status: "Running",coordinate: CLLocationCoordinate2D(latitude: 14.5793, longitude: 120.9724)),
        MapAnnotations(name: "Athlete 2",status: "Running",coordinate: CLLocationCoordinate2D(latitude: 14.5989, longitude: 120.9838))]
    
    
    let baseURL = "http://api.openweathermap.org/data/2.5/weather?"
    let API_KEY = "c75f14d1b5aa76feb7e0ac0fd4571602"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        initLocationManager()
        
        
        for location in locationNames {
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = location.status
            annotation.subtitle = location.name
            
            mapView.addAnnotation(annotation)
        }
        
        
        //        centerMapOnLocation(locationManager.location!)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //        let currentLocation = getCurrentLatLong()
        
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("update")
        let location = locations.last!
        
        getWeatherData(location.coordinate.latitude, long:location.coordinate.longitude)
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        
        self.mapView.setRegion(region, animated: true)
        locationManager.stopUpdatingLocation()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        
        // Don't want to show a custom image if the annotation is the user's location.
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        
        let annotationIdentifier = "pin"
        
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }
        
        if let annotationView = annotationView {
            // Configure your annotation view here
            annotationView.canShowCallout = true
            var image = UIImage()
            let status = annotation.title!!
            
            switch status {
            case "Resting":
                
                image = UIImage(named: "sleep_icon")!
                break;
            case "Swimming":
                
                image = UIImage(named: "training_icon")!
                break;
            case "Running":
                
                image = UIImage(named: "nutrition_icon")!
                break;
            default:
                
                break;
            }
            
            
            annotationView.image = image
        }
        
        return annotationView
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("hm")
        switch status {
        case .notDetermined:
            locationManager.requestAlwaysAuthorization()
            break
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            self.mapView.showsUserLocation = true
            break
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            self.mapView.showsUserLocation = true
            break
        case .restricted:
            // restricted by e.g. parental controls. User can't enable Location Services
            break
        case .denied:
            // user denied your app access to Location Services, but can grant access from Settings.app
            break
        default:
            break
        }
    }
    
    
    func centerMapOnLocation(_ location: CLLocation) {
        
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func initLocationManager(){
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.mapView.showsUserLocation = true
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            print("location!!!! \(locationManager.location)")
            
            
        }
    }
    func getCurrentLatLong() -> CLLocation {
        
        if CLLocationManager.locationServicesEnabled() {
            
            if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
                locationManager.requestWhenInUseAuthorization()
            }else{
                
                locationManager.delegate = self
                locationManager.desiredAccuracy = kCLLocationAccuracyBest
                //                locationManager.requestAlwaysAuthorization()
                locationManager.startUpdatingLocation()
            }
            
        }
        
        
        return locationManager.location!
    }
    
    func getAddressFromCllocation(_ currentLocation: CLLocation){
        
        geocoder.reverseGeocodeLocation(currentLocation) { (placemark, error) in
            
            
            if error == nil && placemark?.count > 0 {
                
                let placemark = placemark?.last
                self.lblCurrentLocation.text = "\(placemark!.locality!)"
                print("place \(placemark!.thoroughfare) \(placemark!.locality) \(placemark?.country) \(placemark?.postalCode)")
                //                self.locationManager.stopUpdatingLocation()
            }
            
        }
        
        
    }
    
    func getWeatherData(_ lat: Double, long: Double){
        
        // This is a pretty simple networking task, so the shared session will do.
        let session = URLSession.shared
        
        let weatherRequestURL = URL(string: "\(baseURL)lat=\(lat)&lon=\(long)&APPID=\(API_KEY)")!
        
        session.dataTask(with: weatherRequestURL) { data, response, error in
            
            if let error = error {
                // Case 1: Error
                // We got some kind of error while trying to get data from the server.
                print("Error:\n\(error)")
            }
            else {
                // Case 2: Success
                // We got a response from the server!
                
                let dataString = String(data: data!, encoding: String.Encoding.utf8)
                //                print("Data:\n\(dataString!)")
                let json = JSON(data:data!)
                let temp = json["main"]["temp"].double
                let locationName = json["name"].string
                self.updateWeatherAndLocation(locationName!, temp: temp!)
                print("wahahaha \(temp) \(locationName)")
                
            }
            }.resume()
        // The data task retrieves the data.
        
        
    }
    
    func updateWeatherAndLocation(_ location: String, temp: Double) {
        
        let celsius = temp - 273.15
        
        DispatchQueue.main.async { () -> Void in
            
            self.lblTemperature.text = "\(celsius)°"
            self.lblCurrentLocation.text = location
        }
        
        
    }
    
    
    
}
