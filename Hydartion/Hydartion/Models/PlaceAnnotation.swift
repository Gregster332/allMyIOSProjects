//
//  PlaceAnnotation.swift
//  Hydartion
//
//  Created by Григорий on 23.04.2021.
//

import MapKit
import UIKit

final class PlaceAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(place: Place) {
        
        self.title = place.title
        self.coordinate = place.coord
    }
    
}
