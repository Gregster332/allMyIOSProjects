//
//  ActivityView.swift
//  Hydartion
//
//  Created by Григорий on 15.04.2021.
//

import SwiftUI

struct ActivityView: View {
    var category = ["Малоподвижный", "Небольшая активность", "Умеренно-активный", "Активный"]
    @Binding var activityOfUser: String
    var body: some View {
        VStack(spacing: 0){
            
            Text("Ваш образ жизни...")
                .font(.system(size: 25))
                .fontWeight(.semibold)
                .padding(.top, 40)
            
            Picker(selection: $activityOfUser, label: Text("Ваш образ жизни..."), content: {
                ForEach(category, id: \.self) {
                    Text($0)
                }
            })
            .shadow(color: Color.black.opacity(0.6), radius: 10, x: 0.0, y: 0.0)
            
            
        }
        .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding()
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activityOfUser: .constant("fff"))
    }
}
