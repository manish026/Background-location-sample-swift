//
//  LocationManager.swift
//  Bacakground location
//
//  Created by APPLE on 08/10/18.
//  Copyright © 2018 APPLE. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager: NSObject {
    
    static var shared = LocationManager()
    
    private var locationManager: CLLocationManager?
    
    var onUpdate: ((CLLocation)->())?
    
    private override init() { }
    
    func setUp() {
        
        self.locationManager = CLLocationManager()
        guard let locationManager = self.locationManager else {
            return
        }
        
        if #available(iOS 9.0, *) {
            locationManager.allowsBackgroundLocationUpdates = true
        } else {
            // Fallback on earlier versions
        }
        
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            // you have 2 choice
            // 1. requestAlwaysAuthorization
            // 2. requestWhenInUseAuthorization
            locationManager.requestAlwaysAuthorization()
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // The accuracy of the location data
        locationManager.distanceFilter = 1 // The minimum distance (measured in meters) a device must move horizontally before an update event is generated.
        
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
}

extension LocationManager : CLLocationManagerDelegate {
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let update = onUpdate {
            update(locations.last!)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    
}
