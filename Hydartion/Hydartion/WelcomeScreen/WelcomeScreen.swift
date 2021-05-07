//
//  WelcomeScreen.swift
//  Hydartion
//
//  Created by Григорий on 13.04.2021.
//

import SwiftUI

struct WelcomeScreen: View {
    
    @State private var nextScreen: Bool = false
    @State private var toMainScreen: Bool = false
    @State private var selectedTab = 0
    
    var body: some View {
        
        if !toMainScreen {
        
        VStack{
            ZStack{
                StartPageView(selectedTab: $selectedTab)
                    .padding()
                    .offset(x: nextScreen ? 400 : 0)
                
                
                FormView(toMainScreen: $toMainScreen)
                    .offset(x: nextScreen ? 0 : 400)
                
            }
            
            Spacer()
            
            
            
                Text("Далее")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.9782662988, blue: 0.8032257557, alpha: 1)))
                    .frame(width: 120, height: 60)
                    .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .offset(y: -30)
                    .padding()
                    .opacity(selectedTab == 2 ? 1 : 0)
                    .offset(x: nextScreen ? 400 : 0)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.5)){
                            self.nextScreen.toggle()
                        }
                    }
            
        }
        .background(
            Image("water")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaleEffect(CGSize(width: 1.7, height: 1.7))
        )
//        .onAppear {
//            UserDefaults.standard.welcomeScreenShown = true
//        }
        } else {
            TabBarView()
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
