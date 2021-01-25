//
//  WaterSettingsView.swift
//  WaterBalance
//
//  Created by Григорий on 28.11.2020.
//

import UIKit

@IBDesignable
class WaterSettingsView: UIView {

    private var size = CGSize()
    @IBInspectable var cornerRadiiSize: CGFloat = 0{
        didSet{
            size = CGSize(width: cornerRadiiSize, height: cornerRadiiSize)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shapeLAyer = CAShapeLayer()
        shapeLAyer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: size).cgPath
        
        layer.mask = shapeLAyer
    }
    
    
    override func prepareForInterfaceBuilder() {
        setNeedsLayout()
    }

}
