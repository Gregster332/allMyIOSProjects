//
//  CircularProgressView.swift
//  WaterBalance
//
//  Created by Григорий on 13.11.2020.
//

import UIKit
import RealmSwift


class CircularProgressView: UIView {
    
     var progressLayer = CAShapeLayer()
     var trackLayer = CAShapeLayer()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createCircularPath()
    }
    
    var progressColor = UIColor.white {
        didSet{
            progressLayer.strokeColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        }
    }
    
    var trackColor = UIColor.white {
        didSet{
            trackLayer.strokeColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }
    
    fileprivate func createCircularPath(){
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width / 2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2), radius: (frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = trackColor.cgColor
        trackLayer.lineWidth = 20
        trackLayer.strokeEnd = 1.0
        layer.addSublayer(trackLayer)
        
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = progressColor.cgColor
        layer.addSublayer(progressLayer)
        

    }
    
    
    public func setupDataCircle(){
        let realm = try! Realm()
        let progress = realm.objects(WaterValue.self)
        for value in progress{
            progressLayer.lineWidth = 30
            print(value.value)
            progressLayer.strokeEnd += CGFloat(value.value)
            layer.addSublayer(progressLayer)
        }
    }
    
}
