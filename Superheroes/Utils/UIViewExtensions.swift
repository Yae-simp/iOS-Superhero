//
//  UIViewExtensions.swift
//  Superheroes
//
//  Created by Tardes on 07/01/2025.
//

import UIKit

extension UIView {
    func roundCorners(radius: CGFloat, maskToBounds: Bool) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = maskToBounds;
    }
    
    func roundCorners(radius: CGFloat) {
        self.roundCorners(radius: radius, maskToBounds: true)
    }
    
    func roundCorners() {
        self.roundCorners(radius: self.layer.frame.width / 2)
    }
    
    func setShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 4
    }
    
    func setBorder(width: CGFloat, color: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
}
