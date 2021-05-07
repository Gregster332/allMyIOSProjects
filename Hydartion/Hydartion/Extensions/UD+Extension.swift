//
//  UD+Extension.swift
//  Hydartion
//
//  Created by Григорий on 13.04.2021.
//

import Foundation

extension UserDefaults {
    
    var welcomeScreenShown: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "welcomeScreenShown") as? Bool) ?? false
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "welcomeScreenShown")
        }
    }
    
    var userName: String {
        get {
            return (UserDefaults.standard.value(forKey: "userName") as? String) ?? "NO NAME"
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "userName")
        }
    }
    
    var weight: String {
        get {
            return (UserDefaults.standard.value(forKey: "weight") as? String) ?? "NO DATA"
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "weight")
        }
    }
    
    
    var actvityOfUser: String {
        get {
            return (UserDefaults.standard.value(forKey: "actvityOfUser") as? String) ?? "NO DATA"
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "actvityOfUser")
        }
    }
    
    
    var arterialPressure: Int {
        get {
            return (UserDefaults.standard.value(forKey: "arterialPressure") as? Int) ?? 0
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "arterialPressure")
        }
    }
    
    var tendencyToEdema: Int {
        get {
            return (UserDefaults.standard.value(forKey: "tendencyToEdema") as? Int) ?? 0
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "tendencyToEdema")
        }
    }
    
    var dayChallenge: Int {
        get {
            return (UserDefaults.standard.value(forKey: "dayChallenge") as? Int) ?? 1700
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "dayChallenge")
        }
    }
    
    var appColor: String {
        get {
            return (UserDefaults.standard.value(forKey: "appColor") as? String) ?? "Orange"
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "appColor")
        }
    }
    
    var pickerChoice: String {
        get {
            return (UserDefaults.standard.value(forKey: "pickerChoice") as? String) ?? "Оранжевый"
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "pickerChoice")
        }
    }
    
    var city: String {
        get {
            return (UserDefaults.standard.value(forKey: "city") as? String) ?? "NO DATA"
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "city")
        }
    }
    
    var sendNotifications: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "sendNotifications") as? Bool) ?? false
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "sendNotifications")
        }
    }
    
    
}
