//
//  AppDelegate.swift
//  WaterBalance
//
//  Created by Григорий on 13.11.2020.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let date = Date()
    let calendar = Calendar.current
    let mainVC = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let currentDay = calendar.component(.day, from: date)
        print("\(currentDay)")
        
        let day = UserDefaults.standard.integer(forKey: "day")
        print("\(day)")
        
        
        
        if day != currentDay{
            mainVC.deleteDataBase()
            mainVC.setupMyCircle()
            getCurrentTime()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    private func getCurrentTime(){
        let date = Date()
        let calendar = Calendar.current
        let day = calendar.component(.day, from: date)
     
        UserDefaults.standard.set(day, forKey: "day")
        
    }
    
   
}

