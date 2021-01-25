//
//  MainVC+alert.swift
//  WaterBalance
//
//  Created by Григорий on 28.11.2020.
//

import UIKit

extension MainViewController{

    func noDataAlert(){
        let ac = UIAlertController(title: "Для начала, введи кол-во воды, которое ты хотел бы потреблять в сутки", message: "Позже, ты сможешь изменить этот параметр в настройках", preferredStyle: .alert)
        ac.addTextField { (tf) in
            tf.placeholder = "Кол-во в мл..."
            tf.keyboardType = .numberPad
        }
        let goAction = UIAlertAction(title: "Поехали!", style: .default) { (action) in
            let textField = ac.textFields?.first
            guard let waterValue = textField?.text else {return}
            if waterValue == "" {
                self.warningAlert(title: "Вы ничего не ввели", message: "Перейдите в настройки и укажите кол-во воды, которое хотите потреблять в сутки")
            } else {
                UserDefaults.standard.set(Int(textField!.text!), forKey: "allWater")
            }
        }

        ac.addAction(goAction)
        present(ac, animated: true, completion: nil)
    }
    
    func warningAlert(title: String, message: String){
       let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
       let cancelAction = UIAlertAction(title: "Ок", style: .cancel, handler: nil)
       
       ac.addAction(cancelAction)
       present(ac, animated: true, completion: nil)
   }
    
    func waterDischarge(){
        
        let ac = UIAlertController(title: "Данные за прошлый день обнулились", message: "Новый день - новая порция воды", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        ac.addAction(okAction)
        present(ac, animated: true, completion: nil)
        
    }
}
