//
//  ForegroundCircle.swift
//  Hydartion
//
//  Created by Григорий on 10.04.2021.
//

import SwiftUI

struct ForegroundCircle: View {
    
    @Binding var progress: Double
    var mlCount: Int
   
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(lineWidth: 30)
                .fill(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .opacity(0.3)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .rotation(Angle(degrees: -90))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
            
            VStack() {
            
            Text("\(Int(progress * 100))%")
                .font(.system(size: 50))
                .fontWeight(.bold)
                .frame(width: 150, height: 40)
                .foregroundColor(.black)
                
                Text("\(Int(progress * Double(mlCount)))ml")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .frame(width: 150, height: 40)
                    .foregroundColor(.black)
                
            }
            
        }
        .frame(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 2.4)
        .onAppear {
            print("\(progress)mmmm")
            print(mlCount)
        }
        
    }
}

struct ForegroundCircle_Previews: PreviewProvider {
    static var previews: some View {
        ForegroundCircle(progress: .constant(0.5), mlCount: 2000)
    }
}
