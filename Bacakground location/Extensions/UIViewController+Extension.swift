//
//  UIViewController+Extension.swift
//  Bacakground location
//
//  Created by Manish on 09/10/18.
//  Copyright © 2018 APPLE. All rights reserved.
//

import UIKit
import MapKit

extension UIViewController {
    
    func set(location: Location) {
        
        for mapView in self.view.subviews where mapView is MKMapView {
            
            let map = mapView as! MKMapView
            map.mapType = .satelliteFlyover
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.location.coordinate
            map.addAnnotation(annotation)
            let newCamera: MKMapCamera = MKMapCamera(lookingAtCenter: location.location.coordinate, fromDistance: 200.0, pitch: 45.0, heading: 90)
            map.setCamera(newCamera, animated: false)
            
        }
        
    }
    
    
    /// Pushes a view controller if navigation controller is present
    
    func push(controller: UIViewController) {
        
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
}
