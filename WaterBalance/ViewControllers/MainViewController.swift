//
//  MainViewController.swift
//  WaterBalance
//
//  Created by Григорий on 13.11.2020.
//

import UIKit
import RealmSwift

class WaterValue: Object{
    @objc dynamic var value: Int = 0
}


class MainViewController: UIViewController {
    
    @IBOutlet weak var otherButton: UIButton!
   
    let cp = CircularProgressView(frame: CGRect(x: 10, y: 10, width: 250, height: 250))
    var textInCircle = UILabel(frame: CGRect(x: 10, y: 10, width: 60, height: 45))
    var textInCircleValue = UILabel(frame: CGRect(x: 10, y: 10, width: 80, height: 45))
    let realm = try! Realm()
    private var progressValue: Int!
    let notif = Notifications()
    let date = Date()
    let calendar = Calendar.current
    
    
    //colors
    let colorOne = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1).cgColor
    let colorTwo = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).cgColor
    let colorThree = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor
    let colorFour = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1).cgColor
    let colorFive = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1).cgColor
    let colorSix = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1).cgColor
    
    private var allMyWater = UserDefaults.standard.double(forKey: "allWater")
    
    var gradientLayer: CAGradientLayer! {
        didSet{
        gradientLayer.startPoint = CGPoint(x: 1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(deleteDataBase), name: Notification.Name("deleteDataBase"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(setupMyCircle), name: Notification.Name("draw"), object: nil)
      
        gradientLayer = CAGradientLayer()
        view.layer.insertSublayer(gradientLayer, at: 0)
      
        setupUIView()
        setupGesture()
        self.notif.auth()
        
        if allMyWater == 0.0{
            DispatchQueue.main.async {
                self.noDataAlert()
            }
        }
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let answer = UserDefaults.standard.bool(forKey: "answer")
        let backgroundIndex = UserDefaults.standard.integer(forKey: "backgroundIndex")
        let circleColor = UserDefaults.standard.integer(forKey: "circleColor")
        
        print(answer)
        
        
        if answer {
            self.notif.center.removeAllPendingNotificationRequests()
            self.notif.sendNotification(hours: 7, minutes: 0, seconds: 0)
            self.notif.sendNotification(hours: 8, minutes: 30, seconds: 0)
            self.notif.sendNotification(hours: 10, minutes: 0, seconds: 0)
            self.notif.sendNotification(hours: 11, minutes: 30, seconds: 0)
            self.notif.sendNotification(hours: 13, minutes: 0, seconds: 0)
            self.notif.sendNotification(hours: 14, minutes: 30, seconds: 0)
            self.notif.sendNotification(hours: 16, minutes: 0, seconds: 0)
            self.notif.sendNotification(hours: 17, minutes: 30, seconds: 0)
            self.notif.sendNotification(hours: 19, minutes: 0, seconds: 0)
            self.notif.sendNotification(hours: 20, minutes: 30, seconds: 0)
            self.notif.sendNotification(hours: 22, minutes: 0, seconds: 0)
            self.notif.sendNotification(hours: 23, minutes: 30, seconds: 0)
        } else {
            self.notif.center.removeAllPendingNotificationRequests()
        }
        
        
        changeCircleColor(index: backgroundIndex)
        
        if circleColor == 0{
            cp.progressLayer.strokeColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        } else if circleColor == 1{
            cp.progressLayer.strokeColor = #colorLiteral(red: 0.897761941, green: 0, blue: 0, alpha: 1)
        } else {
            cp.progressLayer.strokeColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
        }
       
    }
    
    override func viewDidLayoutSubviews() {
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
    private func changeCircleColor(index: Int){
        if index == 0{
            gradientLayer.colors = [colorOne, colorTwo]
        } else if index == 1{
            gradientLayer.colors = [colorThree, colorFour]
        } else {
            gradientLayer.colors = [colorFive, colorSix]
        }
    }
    
    
   
    @IBAction func toWaterSettingsVC(_ sender: UIButton) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "waterSettingsVC") as? WaterSettingsVC else {return}
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func toMainSEttingsVC(_ sender: UIButton){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "mainSettingsVC") as? MainSettingsVC else {return}

        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve

        present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func firstButtonAction(_ sender: UIButton){
       setupAllMyProgress(progressWater: 150)
        
    }
    
    @IBAction func secondButtonAction(_ sender: UIButton) {
        setupAllMyProgress(progressWater: 250)
        
    }
    
    @IBAction func fthirdButtonAction(_ sender: UIButton) {
        setupAllMyProgress(progressWater: 500)
        
    }
    
    @IBAction func otherButtonAction(_ sender: UIButton) {
        print(allMyWater)
    }
    
    @IBAction func delete(){
        deleteDataBase()
        setupMyCircle()
    }
    
    @objc public func deleteDataBase(){
        realm.beginWrite()
        realm.delete(realm.objects(WaterValue.self))
        setupMyCircle()
        try! realm.commitWrite()
    }
    
    private func setupUIView(){
        cp.trackColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        cp.progressColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        self.view.addSubview(cp)
        cp.center = self.view.center
        cp.progressLayer.lineWidth = 20
        let font = UIFont(name: "Symbol", size: 22)
        textInCircle.font = font
        
        textInCircle.font = UIFont.preferredFont(forTextStyle: .headline)
        textInCircle.textAlignment = .center
        textInCircle.center.y = self.cp.center.y - 10
        textInCircle.center.x = self.cp.center.x
        textInCircleValue.font = font
        textInCircleValue.font = UIFont.preferredFont(forTextStyle: .headline)
        textInCircleValue.textAlignment = .center
        textInCircleValue.center.y = self.cp.center.y + 10
        textInCircleValue.center.x = self.cp.center.x
        self.view.addSubview(textInCircle)
        self.view.addSubview(textInCircleValue)
        setupMyCircle()
    }
    
    
     public func setupAllMyProgress(progressWater: Int){
        var progressValue = 0
        
        let progress = realm.objects(WaterValue.self)
        if progress.first != nil{
            progressValue += progress.first!.value
        }
        deleteDataBase()
        
        let value = WaterValue()
        value.value = progressValue + progressWater
        
        realm.beginWrite()
        realm.add(value)
        try! realm.commitWrite()
        
        print(value.value)
        
        setupMyCircle()
       
    }
    
    
    @objc public func setupMyCircle(){
        
        let progress = realm.objects(WaterValue.self)
        if progress.first != nil {
            
            cp.progressLayer.strokeEnd = CGFloat(progress.first!.value) / CGFloat(UserDefaults.standard.integer(forKey: "allWater"))
            //print(cp.progressLayer.strokeEnd)
            if cp.progressLayer.strokeEnd == CGFloat(Double.infinity){
                textInCircle.text = "\(0)%"
                textInCircleValue.text = "\(0)ML"
            } else{
                textInCircle.text = "\(Int(cp.progressLayer.strokeEnd*100))%"
                textInCircleValue.text = "\(progress.first!.value)ML"
            }
        } else {
            cp.progressLayer.strokeEnd = 0.0
            textInCircle.text = "\(0)%"
            textInCircleValue.text = "\(0)ML"
        }
        
    }
}
