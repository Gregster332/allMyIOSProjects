//
//  String+Extensions.swift
//  Weather
//
//  Created by Григорий on 08.01.2021.
//

import Foundation

extension String {
    func escaped() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
}
