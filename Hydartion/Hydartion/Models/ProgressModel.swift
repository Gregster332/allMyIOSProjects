//
//  ProgressModel.swift
//  Hydartion
//
//  Created by Григорий on 24.04.2021.
//

import Foundation
import RealmSwift

class Progress: Object, Identifiable {
    @objc dynamic var id: String = Date().toString()
    @objc dynamic var progress: Double = 0.0
}
