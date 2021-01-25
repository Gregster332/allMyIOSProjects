//
//  MainSettingsVC.swift
//  WaterBalance
//
//  Created by Григорий on 29.11.2020.
//

import UIKit

class MainSettingsVC: UIViewController {
    
    @IBOutlet var backgroundColorView: UIView!
    @IBOutlet var notificationsView: UIView!
    @IBOutlet var circleAndButtonColors: UIView!
    
    @IBOutlet var switchNotifications: UISwitch!
    @IBOutlet var backgroundColorSegment: UISegmentedControl!
    @IBOutlet var circleColorSegment: UISegmentedControl!
    
    
    
    let color1 = #colorLiteral(red: 0.2140574455, green: 0.2658608556, blue: 1, alpha: 0.7).cgColor
    let color2 = #colorLiteral(red: 0.9890852571, green: 0.4469618797, blue: 0, alpha: 0.7).cgColor
    let color3 = #colorLiteral(red: 1, green: 0.152677238, blue: 0.002552638529, alpha: 0.698045238).cgColor
    
    let colorOne = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
    let colorTwo = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).cgColor
    let colorThree = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor
    let colorFour = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1).cgColor
    let colorFive = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
    let colorSix = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1).cgColor
    
    var gradientLayer: CAGradientLayer! {
        didSet{
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGradientToView(view: backgroundColorView)
        addGradientToView(view: notificationsView)
        addGradientToView(view: circleAndButtonColors)
        
        self.switchNotifications.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
        self.backgroundColorSegment.addTarget(self, action: #selector(backgroundColorSegmentSetup), for: .valueChanged)
        self.circleColorSegment.addTarget(self, action: #selector(circleColorSgmentStup), for: .valueChanged)

        self.switchNotifications.isOn = UserDefaults.standard.bool(forKey: "answer")
        self.backgroundColorSegment.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "backgroundIndex")
        self.circleColorSegment.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "circleColor")
        
        
    }
    
    @IBAction func backButton(_ unwindSEgue: UIStoryboardSegue) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    private func addGradientToView(view: UIView){
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        
        let gradientLayer = CAGradientLayer()
    
        gradientLayer.colors = [color1, color2]
        
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    
    @objc private func switchValueChanged(target: UISwitch){
        guard target == self.switchNotifications else {return}
        let answer = target.isOn
        
        UserDefaults.standard.set(answer, forKey: "answer")
    }
    
    @objc private func backgroundColorSegmentSetup(target: UISegmentedControl){
        if target == self.backgroundColorSegment{
            let segmentIndex = target.selectedSegmentIndex
            UserDefaults.standard.set(segmentIndex, forKey: "backgroundIndex")
        }
    }
    
    @objc private func circleColorSgmentStup(target: UISegmentedControl){
        if target == self.circleColorSegment{
            let segmentIndex = target.selectedSegmentIndex
            UserDefaults.standard.set(segmentIndex, forKey: "circleColor")
        }
    }
}
