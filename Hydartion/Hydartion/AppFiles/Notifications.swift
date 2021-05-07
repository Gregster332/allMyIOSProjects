//
//  Notifications.swift
//  Hydartion
//
//  Created by Григорий on 05.05.2021.
//

import Foundation
import UserNotifications


class Notifications: NSObject, UNUserNotificationCenterDelegate {
    
    let center = UNUserNotificationCenter.current()
    
    
    let advices = ["Совет: старайтесь пить как можно больше воды", "Основа жизни - вода!", "Вода поможет снизить вероятность сердечного приступа!", "Вода помогает коже быть мягкой и эластичной"]
    
    public func auth(){
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            guard granted else {return print(error!.localizedDescription)}
        }
    }
    
    public func sendNotification(hours: Int, minutes: Int){
        
        var dateComponents = DateComponents()
        let content = UNMutableNotificationContent()
        
        let ud = UserDefaults.standard
        let appeals = ["\(ud.userName), стоит сделать перерыв и пополнить баланс жидкости!", "\(ud.userName), пора выпить немного воды!"]
        
        content.title = appeals.randomElement()!
        content.body = advices.randomElement()!
        content.sound = UNNotificationSound.default
        
        dateComponents.hour = hours
        dateComponents.minute = minutes
        
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let id = UUID().uuidString
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
        
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.list, .sound])
        
    }
    
}
