//
//  GraphView.swift
//  Hydartion
//
//  Created by Григорий on 26.04.2021.
//

import SwiftUI

struct GraphView: View {
    
    @ObservedObject var progressVM = ProgressViewModel()
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    var body: some View {
       
        VStack{
                
                Text("Сводка о выпитой воде по дням:")
                    .font(.largeTitle)
                    .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                    .multilineTextAlignment(.center)
                
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom){
                    ForEach(progressVM.values) { val in
                        ZStack{
                            
                            OneGraph(progress: val)
                        }
                        
                        
                    }
                }
            }
            
            //            Button(action: {
//                progressVM.fetchData()
//            }, label: {
//                Text("Tap")
//                    .font(.system(size: 20))
//            })
        }
       
        .onReceive(timer) { _ in
            withAnimation(.linear) {
                progressVM.fetchData()
            }
        }
    }
}

struct GraphView_Previews: PreviewProvider {
    static var previews: some View {
        GraphView()
    }
}
