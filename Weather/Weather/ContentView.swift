//
//  ContentView.swift
//  Weather
//
//  Created by Григорий on 07.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var weatherVM = WeatherViewModel()
    @State private var city: String = ""
    @State private var position = CGSize.zero
    
    var body: some View {
        VStack{
            
            VStack{
                Text("Введите название города")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 24, weight: .heavy, design: .default))
                    .frame(width: 320, height: 60, alignment: .center)
                    .padding()
                TextField("Город...", text: self.$city, onEditingChanged: { (_) in}, onCommit: {
                    self.weatherVM.fetchWeather(city: self.city)
                })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
            }
            .background(Color(#colorLiteral(red: 0, green: 0.6905451417, blue: 1, alpha: 0.506194361)))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color(#colorLiteral(red: 1, green: 0.6768136024, blue: 0, alpha: 0.597801158)), radius: 15, x: 10, y: -10)
            .padding()
            
            Spacer()
                .frame(width: 0, height: 200, alignment: .center)
            
            if self.weatherVM.loadingState == .loading {
                LoadingView()
                    .offset(y: -125)
            } else if self.weatherVM.loadingState == .success {
                WeatherView(weatherVM: self.weatherVM)
                    .offset(y: -125)
                    .offset(x: position.width, y: position.height)
                    .animation(Animation.easeInOut(duration: 0.3))
                    .gesture(
                        DragGesture().onChanged { value in
                            self.position = value.translation
                        }
                        .onEnded { value in
                            self.position = .zero
                        }
                    )

                
            } else if self.weatherVM.loadingState == .failed {
                ErrorView(message: self.weatherVM.message)
                    .offset(y: -125)
                    .offset(x: position.width, y: position.height)
                    .animation(Animation.easeInOut(duration: 0.3))
                    .gesture(
                        DragGesture().onChanged { value in
                            self.position = value.translation
                        }
                        .onEnded { value in
                            self.position = .zero
                        }
                    )
            }
        
            Spacer()
        }
        
        .background(Image("background")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center))
        
    }

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct LoadingView: View {
    var body: some View {
        Text("Город не введен...")
            .font(.system(size: 25, weight: .bold, design: .rounded))
            .frame(width: 250, height: 100, alignment: .center)
            .background(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.6284563684)))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}


struct ErrorView: View {
    
    let message: String
    
    var body: some View{
        VStack{
            Text("\(message)")
                .multilineTextAlignment(.center)
                .font(.system(size: 25, weight: .bold, design: .rounded))
            
        }
        .frame(width: 250, height: 100, alignment: .center)
        .background(Color(#colorLiteral(red: 1, green: 0, blue: 0, alpha: 0.6284563684)))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
