//
//  MapView.swift
//  Hydartion
//
//  Created by Григорий on 21.04.2021.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    let places: [Place]
    
    func makeUIView(context: Context) -> MKMapView{
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotations(from: uiView)
    }
    
    private func updateAnnotations(from mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        let annotations = self.places.map(PlaceAnnotation.init)
        mapView.addAnnotations(annotations)
    }
    
}
