//
//  Counter.swift
//  Hydartion
//
//  Created by Григорий on 21.04.2021.
//

import Foundation
import SwiftUI


class Counter {

    var name: String
    var weight: String
    var city: String
    var temp: Int
    var activity: String
    var arterialPressure: Int
    var tendencyToEdema: Int
   
    
    init(name: String, weight: String, city: String, temp: Int, activity: String, arterialPressure: Int, tendencyToEdema: Int) {
        self.name = name
        self.weight = weight
        self.city = city
        self.temp = temp
        self.activity = activity
        self.arterialPressure = arterialPressure
        self.tendencyToEdema = tendencyToEdema
    }
    

    
    private func countDayChallenge() -> Int {
        
        var dayChallenge = 1700
        
        guard let weight = Int(self.weight) else {return 1700}
        
        if weight <= 50 {
            for _ in 30..<weight {
                dayChallenge -= 10
            }
        } else {
            for _ in 51..<weight {
                dayChallenge += 10
            }
        }
        
       
        
        if temp <= -10 {
            dayChallenge -= 150
        } else if temp >= 10 {
            dayChallenge += 250
        } else {
            dayChallenge += 100
        }
        
        
        switch arterialPressure {
        case 1: dayChallenge += 400
        case 2: dayChallenge += 100
        case 3: dayChallenge -= 600
        default:
            dayChallenge += 0
        }
        
        switch activity {
        case "Малоподвижный": dayChallenge -= 200
        case "Небольшая активность": dayChallenge += 100
        case "Умеренно-активный": dayChallenge += 300
        case "Активный": dayChallenge += 600
        default:
            dayChallenge += 0
        }
        
        switch tendencyToEdema {
        case 1: dayChallenge -= 500
        case 2: dayChallenge += 200
        default:
            dayChallenge += 0
        }
        
        return dayChallenge
    }
    
    public func addToUdAllResults() {
        UserDefaults.standard.userName = name
        UserDefaults.standard.weight = weight
        UserDefaults.standard.city = city
        UserDefaults.standard.arterialPressure = arterialPressure
        UserDefaults.standard.actvityOfUser = activity
        UserDefaults.standard.tendencyToEdema = tendencyToEdema
        UserDefaults.standard.dayChallenge = countDayChallenge()
    }
    
}
