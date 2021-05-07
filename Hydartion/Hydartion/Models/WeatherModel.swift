//
//  WeatherModel.swift
//  Hydartion
//
//  Created by Григорий on 29.04.2021.
//

import Foundation

struct WeatherModel: Codable {
    
    let main: Main
    
}

struct Main: Codable {
    
    let temp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
    }
    
}
