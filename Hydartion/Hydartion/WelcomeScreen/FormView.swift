//
//  FormView.swift
//  Hydartion
//
//  Created by Григорий on 14.04.2021.
//

import SwiftUI

struct FormView: View {
    @State private var nameText: String = ""
    @State private var weightText: String = ""
    @State private var city: String = ""
    @State private var temperature: Double = 0.0
    @State private var actvityOfUser: String = ""
    @State private var arterialPressure: Int = 0
    @State private var tendencyToEdema: Int = 0
    @Binding var toMainScreen: Bool
    @StateObject var vm = WeatherViewModel()

    let text = Text("Имя...")
    var body: some View {
        ScrollView {
            VStack() {
                
                if UserDefaults.standard.welcomeScreenShown {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 20))
                        .frame(width: 60, height: 40)
                        .background(Color.red)
                        .cornerRadius(12)
                        .offset(x: -(UIScreen.main.bounds.width / 3))
                        .padding()
                        .onTapGesture {
                            self.toMainScreen.toggle()
                        }
                    
                }
                
                Text("Заполните все поля, чтобы программа вычислила необходимый вам объем воды.")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: 120, alignment: .center)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.9782662988, blue: 0.8032257557, alpha: 1)))
                
                
                HStack{
                    Image(systemName: "person.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .padding()
                    
                    TextField("Имя...", text: $nameText)
                        .foregroundColor(.black)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                }
                .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                
                HStack{
                    Image(systemName: "record.circle.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.black)
                        .padding()
                    
                    TextField("Вес...", text: $weightText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .keyboardType(.numberPad)
                        .padding()
                }
                .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                
                VStack {
                    
                    Text("Введите город вашего проживания для получения температуры...")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    HStack {
                        
                        Image(systemName: "sun.min.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                            .padding()
                        
                        TextField("Город...", text: $city)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding()
                        
                    }
                    
                }
                .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                
                VStack{
                    
                    Text("Артериальное давление...")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .padding()
                    
                    Picker(selection: $arterialPressure, label: Text("Ваш образ жизни..."), content: {
                        Text("Пониж - ое").tag(1)
                        Text("Нормальное").tag(2)
                        Text("Повыш - ое").tag(3)
                        
                    })
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                
                if arterialPressure == 3 {
                    
                    VStack(spacing: 0){
                        
                        Text("Ваш образ жизни...")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .padding(.top, 40)
                        
                        Picker(selection: $actvityOfUser, label: Text("Ваш образ жизни..."), content: {
                            Text("Малоподвижный").tag(1)
                            Text("Небольшая активность").tag(2)
                            Text("Умеренно-активный").tag(3)
                            
                        })
                        .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0.0, y: 0.0)
                        
                        
                    }
                    .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()

                    
                } else {
                    ActivityView(activityOfUser: $actvityOfUser)
                }
                
                
                VStack{
                    
                    Text("Склонность к отекам...")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                        .padding()
                    
                    Picker(selection: $tendencyToEdema, label: Text("Ваш образ жизни..."), content: {
                        Text("Да").tag(1)
                        Text("Нет").tag(2)
                    })
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding()
                
                
                Button(action: {
                    self.toMainScreen.toggle()
                    UserDefaults.standard.welcomeScreenShown = true
                    vm.getWeather(city: city) { temp in
                        let counter = Counter(name: nameText, weight: weightText, city: city, temp: temp, activity: actvityOfUser, arterialPressure: arterialPressure, tendencyToEdema: tendencyToEdema)
                        counter.addToUdAllResults()
                    }
                }, label: {
                    Text("Поехали!")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.9782662988, blue: 0.8032257557, alpha: 1)))
                        .frame(width: 120, height: 60)
                        .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                })
                
                
            }
            .background(Color.clear)
        }
        .onDisappear {
           print("bye")
        }
        
    }
    

}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(toMainScreen: .constant(false))
    }
}
