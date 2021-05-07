//
//  ProfileView.swift
//  Hydartion
//
//  Created by Григорий on 18.04.2021.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var toSettingsView: Bool
    let ud = UserDefaults.standard
    @State private var toReloadSettings: Bool = false
    @State private var userName: String = UserDefaults.standard.userName
    @State private var userWeight: String = UserDefaults.standard.weight
    @State private var userCity: String = UserDefaults.standard.city
    
    var body: some View {
        
        if !toReloadSettings {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20){
                
                HStack(alignment: .top, spacing: 40) {
                    
                    VStack(spacing: 20){
                        
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 60))
                            .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                        
                        Text(ud.userName)
                            .font(.system(size: 30))
                            .fontWeight(.semibold)
                        
                        
                    }
                    .padding()
                    .frame(width: 200)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.7366448045, blue: 1, alpha: 0.5))]), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Image(systemName: "gearshape.2.fill")
                        .padding()
                        .font(.system(size: 35))
                        .foregroundColor(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.7366448045, blue: 1, alpha: 0.5))]), startPoint: .bottomTrailing, endPoint: .topLeading))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            self.toReloadSettings = true
                        }
                    
                }
                
                HStack() {
                    Text("Вес: \(ud.weight)кг")
                        .font(.system(size: 25))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.7366448045, blue: 1, alpha: 0.5))]), startPoint: .bottomTrailing, endPoint: .topLeading))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
                
                HStack {
                    
                    Text("Город: \(ud.city)")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 50)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.7366448045, blue: 1, alpha: 0.5))]), startPoint: .bottomTrailing, endPoint: .topLeading))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                HStack(spacing: 20) {
                    
                    Spacer()
                    
                    VStack(spacing: 10){
                        Text("Артериальное давлние:")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        
                        Text("\(calculatePressure())")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 80)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.7366448045, blue: 1, alpha: 0.5))]), startPoint: .bottomTrailing, endPoint: .topLeading))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                HStack {
                    Spacer()
                    VStack(spacing: 10){
                        Text("Образ жизни:")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .lineLimit(nil)
                        
                        Text("\(ud.actvityOfUser)")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .lineLimit(nil)
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                    
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: 80)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.7366448045, blue: 1, alpha: 0.5))]), startPoint: .bottomTrailing, endPoint: .topLeading))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                Text("ПРИМЕЧАНИЕ: Предпологаемое целевое потребление воды рассчитывается приблизительно на основе вашего веса, артериального давления, образа жизни и климата. Приложение не предпологает использования в мед. целях!")
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .padding()
                    .background(Color.red.opacity(0.6))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                
                Image(systemName: "chevron.backward")
                    .font(.system(size: 30))
                    .frame(width: 100, height: 60, alignment: .center)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.7366448045, blue: 1, alpha: 0.5))]), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.3)) {
                            self.toSettingsView.toggle()
                        }
                    }
                
            }
            .padding()
            .onDisappear() {
                print("hiiii")
            }
        }
        } else {
            FormView(toMainScreen: $toReloadSettings)
        }
    }
    
    private func calculatePressure() -> String{
        
        switch ud.arterialPressure {
        case 1:  return "Пониженное"
        case 2: return "Нормальное"
        case 3: return "Повышенное"
        default:
            return "NO DATA"
        }
        
    }
    
   
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(toSettingsView: .constant(false))
    }
}
