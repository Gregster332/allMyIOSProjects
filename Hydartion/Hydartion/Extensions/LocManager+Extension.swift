//
//  LocManager+Extension.swift
//  Hydartion
//
//  Created by Григорий on 21.04.2021.
//

import Foundation
import MapKit


extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print(status)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {return}
        
        self.location = location
        
    }
    
}
