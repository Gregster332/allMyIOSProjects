//
//  ContentView.swift
//  Hydartion
//
//  Created by Григорий on 10.04.2021.
//

import SwiftUI
import RealmSwift


class Store: ObservableObject {
        @Published var image = 2
}

struct MainView: View {
    
    @State var progress: Double = 0.0
    @State private var blurOn: Bool = false
    
    @State private var opacityOfButtons: Bool = false
    @ObservedObject var store = Store()
    @ObservedObject var progressVM = ProgressViewModel()
    @ObservedObject var notifVM = NotificationSenderViewModel()
    
    var mlPerDay = UserDefaults.standard.dayChallenge
    let notif = Notifications()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        ZStack {
            
        VStack(spacing: 15) {
            
            Text("Прогресс")
                .font(.system(size: 40))
                .fontWeight(.bold)
                .offset(x: -70)
                //.padding(.bottom, 10)
            
            
            ForegroundCircle(progress: $progressVM.progress, mlCount: mlPerDay)
                
            
            VStack(spacing: 20){
                HStack(spacing: 20) {
                    
                    MainButton(countML: 250)
                        .opacity(opacityOfButtons ? 0.5 : 1)
                        .onTapGesture {
                            if progressVM.progress < 1.0 {
                                withAnimation(.default) {
                                    progressVM.progress += 250.0 / Double(mlPerDay)
                                    
                                }
                            }else {
                                self.opacityOfButtons = true
                                progressVM.progress = 1.0
                            }
                        }
                        
                    
                    
                    MainButton(countML: 500)
                        .opacity(opacityOfButtons ? 0.5 : 1)
                        .onTapGesture {
                            if progressVM.progress < 1.0 {
                                withAnimation(.default) {
                                    progressVM.progress += 500.0 / Double(mlPerDay)
                                    
                                }
                            }else {
                                self.opacityOfButtons = true
                                progressVM.progress = 1.0
                            }
                            
                            
                        }
                    
                }
                
                HStack(spacing: 20) {
                    MainButton(countML: 350)
                        .opacity(opacityOfButtons ? 0.5 : 1)
                        .onTapGesture {
                            if progressVM.progress < 1.0 {
                                withAnimation(.default) {
                                    progressVM.progress += 350.0 / Double(mlPerDay)
                                    
                                }
                            } else {
                                self.opacityOfButtons = true
                                progressVM.progress = 1.0
                            }
                        }
                    
                    Text("Другое")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 2.4, height: 60)
                        .background(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        .opacity(opacityOfButtons ? 0.7 : 1)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            if progressVM.progress < 1.0 {
                                withAnimation(.linear(duration: 0.3)) {
                                    self.blurOn.toggle()
                                }
                            } else {
                                self.opacityOfButtons = true
                                progressVM.progress = 1.0
                            }
                        }
                }
            }
            
            
        }
        .blur(radius: blurOn ? 3 : 0)
        .rotation3DEffect(
            Angle(degrees: 10),
            axis: (x: blurOn ? 1 : 0.0, y: 0, z: 0.0))
        .offset(y: blurOn ? -30 : 0)
        //.padding()
        .padding(.bottom, 5)
        
           
            
            OtherView(blurOn: $blurOn, progress: $progressVM.progress, mlCount: mlPerDay)
                .offset(y: blurOn ? 170 : 760)
            
        }
        
        .onAppear{
           
            progressVM.fetchData()
            notifVM.fetchData()
            print(Date().toString())
            //print(UserDefaults.standard.sendNotifications)
            print(notifVM.onNotif)
            print(Realm.Configuration.defaultConfiguration.fileURL)
            //print(progressVM.values.count)
            
            self.notif.auth()
            
            if notifVM.onNotif {
                self.notif.center.removeAllPendingNotificationRequests()
                self.notif.sendNotification(hours: 8, minutes: 00)
                self.notif.sendNotification(hours: 10, minutes: 30)
                self.notif.sendNotification(hours: 11, minutes: 35)
                self.notif.sendNotification(hours: 11, minutes: 36)
                self.notif.sendNotification(hours: 13, minutes: 00)
                self.notif.sendNotification(hours: 15, minutes: 30)
                self.notif.sendNotification(hours: 17, minutes: 01)
                self.notif.sendNotification(hours: 18, minutes: 00)
                self.notif.sendNotification(hours: 20, minutes: 30)
                self.notif.sendNotification(hours: 23, minutes: 00)
            } else {
                self.notif.center.removeAllPendingNotificationRequests()
            }
            
        }
        .onDisappear {
            progressVM.addData()
        }
        
    }
    
    func setBlur() {
        self.blurOn = true
    }
    
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MainView()
                .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
                
            MainView()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE2"))
            
           
        }
    }
}
