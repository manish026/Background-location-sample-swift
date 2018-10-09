//
//  LocationTableViewCell.swift
//  Bacakground location
//
//  Created by APPLE on 08/10/18.
//  Copyright © 2018 APPLE. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var detailLabel: UILabel!
    
    
    func set(location: Location) {
        
        let coordinate = location.location.coordinate
        
        self.titleLabel.text = "lat: \(coordinate.latitude), long: \(coordinate.longitude)"
        
        self.detailLabel.text = "\(location.time!)"
        
    }
}
