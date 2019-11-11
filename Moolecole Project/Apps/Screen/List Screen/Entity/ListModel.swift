//
//  ListModel.swift
//  Moolecole Project
//
//  Created by Nur Irfan Pangestu on 11/11/19.
//  Copyright © 2019 moolecole.test. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListModel {
    
    var description: String
    var image_attachment: JSON
    
    init(_ description: String, _ image_attachment: JSON){
        self.description = description
        self.image_attachment = image_attachment
    }
    
}
