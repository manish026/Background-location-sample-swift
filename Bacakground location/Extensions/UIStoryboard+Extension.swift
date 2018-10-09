//
//  UIStoryboard+Extension.swift
//  Bacakground location
//
//  Created by Manish on 09/10/18.
//  Copyright © 2018 APPLE. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    static var detailsVC: UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC")
    }
    
    
}
