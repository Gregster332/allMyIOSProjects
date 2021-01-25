//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Григорий on 07.01.2021.
//

import Foundation


enum LoadingStates {
    case noneCity
    case loading
    case success
    case failed
}

enum TemperatureUnit: String, CaseIterable {
    case farenheit
    case celsius
}

extension TemperatureUnit {
    var title: String {
        switch self {
        case .celsius:
            return "По Цельсию"
        case .farenheit:
            return "По Фаренгейту"
        }
    }
}

class WeatherViewModel: ObservableObject {
    
    @Published private var weather: Main?
    @Published var message: String = ""
    @Published var loadingState: LoadingStates = .noneCity
    @Published var temperatureUnit: TemperatureUnit = .celsius
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = "__"
    
    var temp: String{
        guard let temp = weather?.temp else {return "NO DATA"}
        switch temperatureUnit {
        case .farenheit:
            return String(format: "%.0F°F", temp.toFarenheit())
        case .celsius:
            return String(format: "%.0F°C", temp.toCelsius())
        }
    }
    
    var humidity: Int {
        guard let humidity = weather?.humidity else {return 0}
        return humidity
    }
    
    //let conditionCode: Int
    
    
    func fetchWeather(city: String) {
        
        guard let city = city.escaped() else {
            DispatchQueue.main.async {
                self.message = "Неправильно введен\n город"
            }
            return
        }
        
        self.loadingState = .loading
        
        CurrentWeatherService().getWeather(city: city) { result in
            switch result{
            case .success(let weather):
                
                var systemIconNameString: String {
                    switch (weather?.weather.first?.id)! {
                    case 200...232: return "cloud.bolt.rain.fill"
                    case 300...321: return "cloud.drizzle.fill"
                    case 500...531: return "cloud.rain.fill"
                    case 600...622: return "cloud.snow.fill"
                    case 701...781: return "smoke.fill"
                    case 800: return "sun.min.fill"
                    case 801...804: return "cloud.fill"
                    default: return "nosign"
                    }
                }
                
                DispatchQueue.main.async {
                    //print(weather)
                    self.weather = weather?.main
                    self.loadingState = .success
                    //self.weatherDescription = (weather?.weather.first!.weatherDescription)!
                    self.weatherIcon = systemIconNameString
                }
            case .failure(_):
                DispatchQueue.main.async{
                    self.loadingState = .failed
                    self.message = "Неправильно введен\n город"
                }
            }
        }
    
    }
    
}
