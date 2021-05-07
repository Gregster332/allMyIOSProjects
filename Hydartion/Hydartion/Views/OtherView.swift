//
//  OtherView.swift
//  Hydartion
//
//  Created by Григорий on 10.04.2021.
//

import SwiftUI

struct OtherView: View {
    
    @Binding var blurOn: Bool
    @Binding var progress: Double
    @ObservedObject var progressVM = ProgressViewModel()
    var mlCount: Int?
    
    var body: some View {
        VStack{
                VStack {
                    
                    
                    Text("Добавить определенное\nкол-во воды:")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    
                    VStack{
                        
                        Slider(value: $progress)
                            .frame(width: 250)
                        //.padding()
                        
                        Text("\(Int(Double(mlCount!) * progress)) ml будет\nотображаться в прогрессе")
                            .font(.system(size: 22))
                            .lineLimit(nil)
                            .multilineTextAlignment(.center)
                            .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    }
                    
                    
                    
                    
                    Button(action: {
                        withAnimation(.linear(duration: 0.3)) {
                            self.blurOn.toggle()
                            
                        }
                    }, label: {
                        Text("Сохранить")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color(#colorLiteral(red: 0.8477862477, green: 0.2311009169, blue: 0.2163309753, alpha: 1)))
                            .padding()
                            .frame(width: 170, height: 50)
                            .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        
                        
                    })
                    .padding()
                    
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 600)
                .background(Color.gray)
             
        }
        .edgesIgnoringSafeArea(.bottom)
                
        
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        OtherView(blurOn: .constant(false), progress: .constant(0.6), mlCount: 2000)
    }
}
