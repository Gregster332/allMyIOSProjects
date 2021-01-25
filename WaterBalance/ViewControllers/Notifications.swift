//
//  Notifications.swift
//  WaterBalance
//
//  Created by Григорий on 29.11.2020.
//

import UIKit
import UserNotifications

class Notifications: NSObject, UNUserNotificationCenterDelegate {
    
    let center = UNUserNotificationCenter.current()
    let advices = ["Совет: старайтесь пить как можно больше воды", "Основа жизни - вода!", "Вода поможет снизить вероятность сердечного приступа!", "Вода помогает коже быть мягкой и эластичной"]
    lazy var randomNumberForAdvice = Int.random(in: 0...3)
    
    public func auth(){
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            guard granted else {return print(error!.localizedDescription)}
        }
    }
    
    public func sendNotification(hours: Int, minutes: Int, seconds: Int){
        
        var dateComponents = DateComponents()
        let content = UNMutableNotificationContent()
        
        content.title = "Пора выпить немного воды!"
        content.body = advices[randomNumberForAdvice]
        content.sound = UNNotificationSound.default
        
        dateComponents.hour = hours
        dateComponents.minute = minutes
        dateComponents.second = seconds
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let id = UUID().uuidString
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: nil)
        
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.list, .sound])
        
    }
}
