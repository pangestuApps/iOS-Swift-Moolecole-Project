//
//  UIImageView.swift
//  Moolecole Project
//
//  Created by Nur Irfan Pangestu on 12/11/19.
//  Copyright © 2019 moolecole.test. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

let imageCahce = NSCache<NSURL, UIImage>()

extension UIImageView {
    
    
    
    public  func loadImageUsingString(urlString: String, newsz : CGSize) {
        var _ : String?
        //var  imageme = UIImage()
        
        let url = NSURL(string: urlString)
        
        if let imageFromCahche = imageCahce.object(forKey:url!)  {
            self.image = imageFromCahche
            return
        }
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                print(error ?? "error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                //  self.kf.setImage(with: )
                let imagetoCache = UIImage(data: data!)?.scaledImage(withSize: newsz)
                imageCahce.setObject(imagetoCache!, forKey: url!)
                
              //  scaledImage(newsz)
                self.image = imagetoCache!
                //scaleImageToFitSize(size: newsz)
                    //imagetoCache!
                //  let image = UIImage(data: data!)
                // self.image = image
            })
            
        }).resume()
    }
    
    
}
