//
//  SettingsScreen.swift
//  Hydartion
//
//  Created by Григорий on 14.04.2021.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State private var toProfileView: Bool = false
    @State private var appColor: String = UserDefaults.standard.pickerChoice
    @State private var onToggle: Bool = UserDefaults.standard.sendNotifications
    

    
    var body: some View {
        VStack{
            
            if !toProfileView {
                
                VStack{
                    VStack{
                        Divider()
                        
                        HStack(spacing: 20){
                            
                            Image(systemName: "person.circle.fill")
                                .font(.system(size: 45))
                                .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                            
                            VStack(alignment: .leading){
                                
                                Text(UserDefaults.standard.userName)
                                    .font(.system(size: 25))
                                    .fontWeight(.bold)
                                
                                Text("Дневная цель: \(UserDefaults.standard.dayChallenge)ml")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                            }
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 25))
                            
                        }
                        
                        Divider()
                    }
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.3)) {
                            self.toProfileView.toggle()
                        }
                    }
                    
                    
                    BackColorView(appColor: $appColor)
                    
                    NotificationsSettings()
                    
                    Spacer()
                }
            } else {
                ProfileView(toSettingsView: $toProfileView)
            }
        }
        .onAppear {
            print("hello")
            
        }
        .onDisappear() {
            UserDefaults.standard.pickerChoice = appColor
            UserDefaults.standard.appColor = addNewColor()
            UserDefaults.standard.sendNotifications = onToggle
            //notifVM.addData()
            
        }
        
    }
    
    private func addNewColor() -> String{
        switch appColor {
        case "Оранжевый": return "Orange"
        case "Красный": return "Red"
        case "Зеленый": return "Green"
        case "Желтый": return "Yellow"
        case "Фиолетовй": return "Violet"
        default:
            return "Orange"
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
