//
//  ViewController.swift
//  Bacakground location
//
//  Created by APPLE on 08/10/18.
//  Copyright © 2018 APPLE. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    
    //MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variable declarations
    var locations: [Location] = []
    
    //MARK: Functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        LocationManager.shared.setUp()
        LocationManager.shared.onUpdate = { [weak self] (location) in
            
            let model = Location(location: location, time: Date())
            self?.locations.append(model)
            self?.tableView.reloadData()
        }
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LocationTableViewCell
        
        cell.set(location: locations[indexPath.row])
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let controller = UIStoryboard.detailsVC
        controller.set(location: locations[indexPath.row])
        push(controller: controller)
    }
    
}

