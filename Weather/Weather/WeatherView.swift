//
//  lll.swift
//  Weather
//
//  Created by Григорий on 25.01.2021.
//
import SwiftUI

struct WeatherView: View {
    
    @ObservedObject var weatherVM: WeatherViewModel
    @State private var position = CGSize.zero
    
    var body: some View {
        VStack{
            VStack{
                
                Image(systemName: "\(weatherVM.weatherIcon)")
                    .font(.system(size: 80))
                    .frame(width: 100, height: 100, alignment: .center)
        
                
//                Text("\(weatherVM.weatherDescription)")
//                    .font(.system(size: 24, weight: .bold, design: .default))
//                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
//
                Text("\(self.weatherVM.temp)")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                Text("Влажность \(self.weatherVM.humidity)%")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                
                Picker(selection: self.$weatherVM.temperatureUnit, label: Text("В чем измерять?"), content: {
                    ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                        Text(unit.title)
                    }
                }).pickerStyle(SegmentedPickerStyle())
                .padding()
                
            }
            
            .frame(width: 320, height: 300, alignment: .center)
            .background(Color(#colorLiteral(red: 0, green: 0.6905451417, blue: 1, alpha: 0.506194361)))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .circular))
    
        }
        
    }
}
