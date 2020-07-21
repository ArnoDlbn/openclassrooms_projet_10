//
//  UIImageView.swift
//  Reciplease
//
//  Created by Arnaud Dalbin on 06/06/2020.
//  Copyright © 2020 Arnaud Dalbin. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func addBlackGradientLayerInForeground() {
        let gradient = CAGradientLayer()
        
        gradient.frame = frame
        gradient.locations = [0.0, 1.0]
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.opacity = 0.75
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func removeAllGradientLayerInForeground() {
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }
}
