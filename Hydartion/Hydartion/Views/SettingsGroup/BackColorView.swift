//
//  BackColorView.swift
//  Hydartion
//
//  Created by Григорий on 19.04.2021.
//

import SwiftUI

struct BackColorView: View {
    
    @Binding var appColor: String
    var arrayOfColors = ["Оранжевый", "Красный", "Зеленый", "Желтый", "Фиолетовй"]
    
    var body: some View {
        VStack {
            
            
            
            Text("Цвет заднего фона:")
                .font(.system(size: 20))
                .fontWeight(.semibold)
            
            
            Picker(selection: $appColor, label: Text("Цвета"), content: {
                ForEach(arrayOfColors, id: \.self) { color in
                    Text(color).tag(color)
                }
            })
            
            
            
        }
        .padding()
        .frame(maxWidth: UIScreen.main.bounds.width - 30, maxHeight: 270, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.7366448045, blue: 1, alpha: 0.5))]), startPoint: .bottomTrailing, endPoint: .topLeading))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        
    }
}

struct BackColorView_Previews: PreviewProvider {
    static var previews: some View {
        BackColorView(appColor: .constant("j"))
    }
}
