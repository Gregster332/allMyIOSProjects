//
//  CurrentWeatherData.swift
//  Weather
//
//  Created by Григорий on 07.01.2021.
//

import Foundation

//struct CurrentWaetherData: Codable{
//
//    let name: String
//    let main: Main
//    let weather: [Weather]
//
//}
//
//struct Main: Codable{
//    let temp: Double
//    let feelsLike: Double
//    let humidity: Int
//
//    enum CodingKeys: String, CodingKey {
//        case temp
//        case feelsLike = "feels_like"
//        case humidity
//    }
//}
//
//struct Weather: Codable {
//    let description: String
//    let iconName: String
//
//    enum CodingKeys: String, CodingKeys{
//        case description
//        case iconName = "main"
//    }
//}

struct CurrentWaetherData: Codable {
    
    let weather: [Weather]
    let main: Main
    let name: String
   
}



// MARK: - Main
struct Main: Codable {
    let temp, feelsLike: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case humidity
    }
}

// MARK: - Weather
struct Weather: Codable {
    let weatherDescription: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
        case id
    }
}

