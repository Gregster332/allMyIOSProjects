//
//  NotificationsSettings.swift
//  Hydartion
//
//  Created by Григорий on 05.05.2021.
//

import SwiftUI

struct NotificationsSettings: View {
    @ObservedObject var notifVM = NotificationSenderViewModel()
    let timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()
    var body: some View {
        HStack() {
                
//            Toggle(isOn: $notifVM.onNotif, label: {
//                Text("Уведомления: ")
//                    .font(.system(size: 25))
//                    .fontWeight(.semibold)
//
//            })
//            .padding()
            
            Text("Уведомления: ")
                .font(.system(size: 25))
                .fontWeight(.semibold)
            
            Text(notifVM.onNotif ? "Вкл." : "Выкл.")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .frame(width: 100, height: 70)
                .background(notifVM.onNotif ? Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)) : Color(#colorLiteral(red: 1, green: 0.1382228136, blue: 0, alpha: 0.8242732168)))
                .cornerRadius(12)
                .onTapGesture {
                    notifVM.onNotif.toggle()
                    notifVM.addData()
                }
                
            }
        .frame(maxWidth: UIScreen.main.bounds.width - 30, maxHeight: 100, alignment: .center)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.7366448045, blue: 1, alpha: 0.5))]), startPoint: .bottomTrailing, endPoint: .topLeading))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .onAppear {
            notifVM.fetchData()
            print(notifVM.onNotif)
            
        }
        .onReceive(timer, perform: { _ in
            notifVM.fetchData()
        })
            
        
    }
}

struct NotificationsSettings_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsSettings()
    }
}
