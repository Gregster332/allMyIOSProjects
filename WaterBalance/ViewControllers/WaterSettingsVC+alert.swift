//
//  MainVC+alert.swift
//  WaterBalance
//
//  Created by Григорий on 28.11.2020.
//

import UIKit

extension WaterSettingsVC {
     func warningAlert(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
        
        ac.addAction(cancelAction)
        present(ac, animated: true, completion: nil)
    }
}
