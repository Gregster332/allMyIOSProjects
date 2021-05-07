//
//  PlacesModel.swift
//  Hydartion
//
//  Created by Григорий on 23.04.2021.
//

import Foundation
import MapKit

struct Place{

    let place: MKPlacemark
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        self.place.name ?? ""
    }
    
    var title: String {
        self.place.description
    }
    
    var coord: CLLocationCoordinate2D {
        self.place.coordinate
    }
}
