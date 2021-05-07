//
//  Button.swift
//  Hydartion
//
//  Created by Григорий on 10.04.2021.
//

import SwiftUI

struct MainButton: View {
    
    var countML: Int
    var icon: String = "drop.fill"
    
    var body: some View {
        
        
        VStack {
            
            
                HStack(spacing: 12){
                Text("\(countML)ml")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
                    Image(systemName: icon)
                        .font(.system(size: 25))
                        .foregroundColor(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width / 2.4, height: 60)
                .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            
            
        }
        
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        MainButton(countML: 400)
    }
}
