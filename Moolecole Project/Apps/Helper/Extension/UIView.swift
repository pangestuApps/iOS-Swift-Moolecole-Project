//
//  UIView.swift
//  Moolecole Project
//
//  Created by Nur Irfan Pangestu on 11/11/19.
//  Copyright © 2019 moolecole.test. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setCornerRadius(cornerRadius: CGFloat = 2.0, shadowRadius: CGFloat = 1.0, borderWidth: CGFloat = 0.0) {
        
        layer.cornerRadius = cornerRadius
        layer.shadowRadius = shadowRadius
        layer.borderWidth = borderWidth
        layer.borderColor = UIColor(red: 228.0/255.0, green: 228.0/255.0, blue: 228.0/255.0, alpha: 0.25).cgColor
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width:1, height:1)
        layer.masksToBounds = false
    }
    
}
