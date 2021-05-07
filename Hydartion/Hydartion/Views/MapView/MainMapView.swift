//
//  MainMapView.swift
//  Hydartion
//
//  Created by Григорий on 21.04.2021.
//

import SwiftUI
import MapKit

struct MainMapView: View {
    
    @ObservedObject var locationManager = LocationManager()
    @State private var places: [Place] = [Place]()
    @State private var search: String = ""
    @ObservedObject private var kGuardian = KeyboardGuardian(textFieldCount: 1)
    
    
    
    private func getNearPlaces() {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = search
        
        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            
            if let response = response {
                let mapItems = response.mapItems
                self.places = mapItems.map {
                    Place(place: $0.placemark)
                }
            }
            
        }
        
    }
    
    var body: some View {
        
       
        
        ZStack(alignment: .bottom) {
            
            MapView(places: self.places)
                .edgesIgnoringSafeArea(.all)
            
            TextField("Ближайший магазин...", text: $search) { _ in}
            onCommit: {
                self.getNearPlaces()
               
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .offset(y: kGuardian.slide).animation(.easeInOut(duration: 0.4))
        
        }
        .onAppear { self.kGuardian.addObserver() }
        .onDisappear { self.kGuardian.removeObserver() }
        
    }
}

struct MainMapView_Previews: PreviewProvider {
    static var previews: some View {
        MainMapView()
    }
}
