//
//  String+Extension.swift
//  Hydartion
//
//  Created by Григорий on 29.04.2021.
//

import Foundation


extension String {
    func escaped() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
