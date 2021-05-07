//
//  NotificationSenderModel.swift
//  Hydartion
//
//  Created by Григорий on 05.05.2021.
//

import Foundation
import RealmSwift

class NotificationSenderModel: Object {
    @objc dynamic var onNotifications: Bool = false
}
