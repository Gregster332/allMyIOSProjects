//
//  CurrentWeatherService.swift
//  Weather
//
//  Created by Григорий on 07.01.2021.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noData
    case decodingError
}

class CurrentWeatherService {
    
    func getWeather(city: String, completion: @escaping (Result<CurrentWaetherData?, NetworkError>) -> Void) {
        guard let url = URL.urlForWeather(city: city) else {
            return completion(.failure(.badUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let weatherData = try? JSONDecoder().decode(CurrentWaetherData.self, from: data)
            if let weatherData = weatherData {
                completion(.success(weatherData))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}
