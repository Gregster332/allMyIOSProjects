//
//  OneGraph.swift
//  Hydartion
//
//  Created by Григорий on 27.04.2021.
//

import SwiftUI

struct OneGraph: View {
    
    var progress: Progress
    let ud = UserDefaults.standard
    
    var body: some View {
        
        
            VStack {
                
                Text("\(Int(progress.progress * Double(ud.dayChallenge)))ML")
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    .padding()
                
                
                ZStack(alignment: .bottom){
                    
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width / 10, height: CGFloat(1) * 200, alignment: .center)
                        .foregroundColor(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
                    
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: UIScreen.main.bounds.width / 10, height: CGFloat(progress.progress) * 200, alignment: .center)
                        .foregroundColor(Color(#colorLiteral(red: 0.4618452191, green: 0.880348444, blue: 1, alpha: 1)))
                }
                Text(progress.id)
                    .font(.system(size: 12))
                    .fontWeight(.bold)
                    
                    .padding()
                
            
        }
        
    }
}

struct OneGraph_Previews: PreviewProvider {
    static var previews: some View {
        OneGraph(progress: Progress(value: 0.7))
    }
}
