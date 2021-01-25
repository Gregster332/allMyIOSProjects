//
//  PlusWaterViaPopoverVC.swift
//  WaterBalance
//
//  Created by Григорий on 09.12.2020.
//

import UIKit
import RealmSwift

class PlusWaterViaPopoverVC: UIViewController {
    
    @IBOutlet weak var addwaterLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var plusBtn: UIButton!
    
    let allWater =  UserDefaults.standard.double(forKey: "allWater")
    let realm = try! Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.slider.maximumValue = Float(allWater)
        self.slider.addTarget(self, action: #selector(sliderAction), for: .valueChanged)
        
        self.plusBtn.addTarget(self, action: #selector(addWater), for: .touchUpInside)
       
    }
    
    
    
    @objc private func sliderAction(sender: UISlider){
        
        if sender == slider{
            self.addwaterLabel.text = "Добавить \(Int(sender.value)) мл воды"
        }
        
    }
    
    @objc private func addWater(sender: UIButton){
        if sender == plusBtn{
            let mainVC = MainViewController()
            dismiss(animated: true, completion: nil)
            mainVC.setupAllMyProgress(progressWater: Int(slider.value))
            NotificationCenter.default.post(name: Notification.Name("draw"), object: nil)
        }
    }
    
}
