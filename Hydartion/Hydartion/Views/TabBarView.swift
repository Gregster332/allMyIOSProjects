//
//  TabView.swift
//  Hydartion
//
//  Created by Григорий on 11.04.2021.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedIndex = 0
    @StateObject var VM = WeatherViewModel()
   
    let tabBarIcons = ["drop.fill", "gearshape.2.fill", "waveform.path.ecg", "location.fill"]
    let tabBarTexts = ["Прогресс", "Настройки", "График", "Хочу пить!"]
   
    
    
    var body: some View {
        
        if UserDefaults.standard.welcomeScreenShown {
        
        VStack{
            
            Spacer()
            
            ZStack{
                switch selectedIndex {
                case 0: MainView()
                case 1: SettingsScreen()
                case 2: GraphView()
                case 3: MainMapView()
                default:
                    Text("")
                }
                
                
            }
            
            
            Spacer()
            HStack{
                ForEach(0..<4){ num in
                    Button(action: {
                        self.selectedIndex = num
                    }, label: {
                        
                            Spacer()
                            
                            if num == 0 {
                                VStack{
                                    Image(systemName: tabBarIcons[num])
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(selectedIndex == num ? Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)) : .gray)
                                    Text(tabBarTexts[num])
                                        .font(.system(size: 13))
                                        .foregroundColor(selectedIndex == num ? .black : .gray)
                                }
                                
                            } else {
                                VStack{
                                    Image(systemName: tabBarIcons[num])
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundColor(selectedIndex == num ? .black : .gray)
                                    Text(tabBarTexts[num])
                                        .font(.system(size: 13))
                                        .foregroundColor(selectedIndex == num ? .black : .gray)
                                }
                                
                            }
                            Spacer()
                        
                    })
                    
                }
            }
            .frame(maxHeight: UIScreen.main.bounds.height / 16)
            .padding(.all, 10)
            .offset(y: -(UIScreen.main.bounds.minY + 7))
            .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)).edgesIgnoringSafeArea(.all))
            
            
            
            
            
        }
        .background(Color(UserDefaults.standard.appColor).edgesIgnoringSafeArea(.all))
        
        }
        else {
            WelcomeScreen()
        }
        
    }
    
    
}
    
    


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            TabBarView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
            TabBarView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            
           
        }
    }
}



