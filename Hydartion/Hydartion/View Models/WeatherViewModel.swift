//
//  WeatherViewModel.swift
//  Hydartion
//
//  Created by Григорий on 29.04.2021.
//

import Foundation
import MapKit


class WeatherViewModel: ObservableObject {
    
    
    
    func getWeather(city: String, completion: @escaping(Int) -> Void) {
        
        guard let city = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=c302a638f8f46f6a557e143a3a483647") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {return}
            
            let weatherData = try? JSONDecoder().decode(WeatherModel.self, from: data)
            if let weatherData = weatherData {
                DispatchQueue.main.async {
                    let temperature = (Int(weatherData.main.temp) - 273)
                    completion(temperature)
                }
            }
            else {
                
                guard let error = error else {return}
                print(error.localizedDescription)
                
            }
        }.resume()
        
    }
    
}
