//
//  UIImage.swift
//  Moolecole Project
//
//  Created by Nur Irfan Pangestu on 12/11/19.
//  Copyright © 2019 moolecole.test. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
//    func resized(to size: CGSize) -> UIImage {
//        if #available(iOS 10.0, *) {
//            return UIGraphicsImageRenderer(size: size).image { _ in
//                draw(in: CGRect(origin: .zero, size: size))
//            }
//        } else {
//            // Fallback on earlier versions
//        }
//    }
    
    func scaledImage(withSize size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height))
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
    func scaleImageToFitSize(size: CGSize) -> UIImage {
        let aspect = self.size.width / self.size.height
        if size.width / aspect <= size.height {
            return scaledImage(withSize: CGSize(width: size.width, height: size.width / aspect))
        } else {
            return scaledImage(withSize: CGSize(width: size.height * aspect, height: size.height))
        }
    }
    
}
