//
//  StartPageView.swift
//  Hydartion
//
//  Created by Григорий on 17.04.2021.
//

import SwiftUI

struct StartPageView: View {
    
    private let colorsArray = ["Добро пожаловать в Hydration!", "Данное приложение может контроллировать количество воды, которое человек потребляет в течении дня.", "Для начала, нужно определить количество воды, которое необходимо выпивать именно вам. Для этого нужно нажать кнопку далее и заполнить пару полей!"]
    @Binding var selectedTab: Int
    @State private var animation: Bool = false
    let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            ForEach(0..<colorsArray.count, id: \.self) { page in
               
                 Text(colorsArray[page])
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .frame(width: 270, height: 450)
                    .padding(.all, 5)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.8883425593, blue: 1, alpha: 0.8)), Color(#colorLiteral(red: 0, green: 1, blue: 0.5824229121, alpha: 0.66)), Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .scaleEffect(CGSize(width: animation ? 1.06 : 1.0, height: animation ? 1.06 : 1.0))
                    .rotationEffect(.degrees(animation ? 5 : -5))
                    .opacity(animation ? 0.8 : 1)
                    .offset(y: -(UIScreen.main.bounds.height / 15))
                    .onReceive(timer) { _ in
                       
                            self.animation.toggle()
                        //self.animation.toggle()
                        
                    }
                
            }
            
        }
        .edgesIgnoringSafeArea(.all)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .overlay(ThreeDotsView(pageCount: colorsArray.count, selectedTab: selectedTab))
        .animation(.easeIn)
    }
}

struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView(selectedTab: .constant(0))
    }
}


struct ThreeDotsView: View {
    
    var pageCount: Int
    let selectedTab: Int
    
    private let circleSize: CGFloat = 16
    private let circleSpacing: CGFloat = 12
    
    private let colorOfActiveDots: Color = Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
    private let secondaryColor = Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
    
    private let smallScale: CGFloat = 0.6
    
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<pageCount) { index in
                if shouldShowIndex(index) {
                    Circle()
                        .fill(selectedTab == index ? colorOfActiveDots : secondaryColor)
                        .scaleEffect(selectedTab == index ? 1 : smallScale)
                        .frame(width: circleSize, height: circleSize)
                        
                }
            }
        }
        .opacity(selectedTab == 2 ? 0 : 1)
        .padding(.top, UIScreen.main.bounds.height - 200)
    }
    
    func shouldShowIndex(_ index: Int) -> Bool {
        ((selectedTab - 1)...(selectedTab + 1)).contains(index)
    }
}
