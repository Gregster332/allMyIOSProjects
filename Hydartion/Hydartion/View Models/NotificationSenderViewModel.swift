//
//  NotificationSenderViewModel.swift
//  Hydartion
//
//  Created by Григорий on 05.05.2021.
//

import Foundation
import RealmSwift

class NotificationSenderViewModel: ObservableObject {
    
    @Published var onNotif: Bool = false
    //@Published var updatetdObject: NotificationSenderModel?
    
    func fetchData(){
        
        guard let dbRef = try? Realm() else{return}
        
        let notif = dbRef.objects(NotificationSenderModel.self)
        
        self.onNotif = notif.first?.onNotifications ?? false
    }
    
    func addData() {
        
        
        let notificationSenderModel = NotificationSenderModel()
        notificationSenderModel.onNotifications = self.onNotif

        deleteData()
        
        guard let dbRef = try? Realm() else {return}
        
        dbRef.beginWrite()
        dbRef.add(notificationSenderModel)
        
        try! dbRef.commitWrite()
        
    }
    
    func deleteData() {
        
        guard let dbRef = try? Realm() else {return}
        
        dbRef.beginWrite()
        dbRef.delete(dbRef.objects(NotificationSenderModel.self))
        fetchData()
        try! dbRef.commitWrite()
        
    }
    
}
