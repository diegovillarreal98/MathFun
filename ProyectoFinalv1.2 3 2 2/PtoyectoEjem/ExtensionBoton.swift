//
//  ExtensionUIButton.swift
//  ejemploAnimationButtons
//
//  Created by user168657 on 4/21/20.
//  Copyright © 2020 user168657. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func pulsar () {
        let pulsa = CASpringAnimation(keyPath: "transform.scale")
        pulsa.duration = 0.45
        pulsa.fromValue = 0.95
        pulsa.toValue = 1.0
        pulsa.autoreverses = true
        pulsa.repeatCount = 1
        pulsa.initialVelocity = 0.5
        pulsa.damping = 5.0
        
        layer.add(pulsa, forKey: nil)
    }
    
    func flash () {
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.1
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        
        layer.add(flash, forKey: nil)
    }
    
    func shake () {
        let shake = CABasicAnimation(keyPath: "position" )
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 5, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 5, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
}
