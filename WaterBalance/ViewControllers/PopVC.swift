//
//  PopVC.swift
//  WaterBalance
//
//  Created by Григорий on 09.12.2020.
//

import Foundation
import UIKit

extension MainViewController: UIPopoverPresentationControllerDelegate {
    
    public func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        tapGesture.numberOfTapsRequired = 1
        otherButton.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func tapped(){
        guard let popVC = storyboard?.instantiateViewController(withIdentifier: "popVC") else {return}
        popVC.modalPresentationStyle = .popover
        let popOver = popVC.popoverPresentationController
        popOver?.delegate = self
        
        popOver?.sourceView = self.otherButton
        popOver?.sourceRect = CGRect(x: self.otherButton.bounds.midX, y: self.otherButton.bounds.minY, width: 0, height: 0)
        popVC.preferredContentSize = CGSize(width: 300, height: 200)
        
        self.present(popVC, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
}
