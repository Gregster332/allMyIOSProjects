//
//  URL+Extension.swift
//  Weather
//
//  Created by Григорий on 07.01.2021.
//

import Foundation

extension URL {
    
    static func urlForWeather(city: String) -> URL? {
        guard let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=c302a638f8f46f6a557e143a3a483647") else {
            return nil
        }
        return url
    }
    
}
