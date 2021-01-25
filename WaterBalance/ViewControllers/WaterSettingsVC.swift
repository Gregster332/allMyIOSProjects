//
//  WaterSettingsVC.swift
//  WaterBalance
//
//  Created by Григорий on 28.11.2020.
//

import UIKit

class WaterSettingsVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    let mainVC = MainViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    @objc private func kbWillShow(notification: NSNotification){
        view.frame.origin.y = -100
        
        
    }
    
    
    @IBAction func saveWaterValue(_ sender: UIButton) {
        
        if textField.text == ""{
            warningAlert(title: "Вы ничего не ввели", message: "Пожалуйста, введите кол-во воды в мл")
        } else {
            UserDefaults.standard.set(Int(textField.text!), forKey: "allWater")
            UserDefaults.standard.synchronize()
            mainVC.deleteDataBase()
            NotificationCenter.default.post(name: Notification.Name("deleteDataBase"), object: nil)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
