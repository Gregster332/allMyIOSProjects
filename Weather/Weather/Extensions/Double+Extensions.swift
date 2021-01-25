//
//  File.swift
//  Weather
//
//  Created by Григорий on 08.01.2021.
//

import Foundation

extension Double {
    
    func toFarenheit() -> Double{
        let temp = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        let convertableTemp = temp.converted(to: .fahrenheit)
        return convertableTemp.value
    }
    
    func toCelsius() -> Double{
        let temp = Measurement<UnitTemperature>(value: self, unit: .kelvin)
        let convertableTemp = temp.converted(to: .celsius)
        return convertableTemp.value
    }
}
