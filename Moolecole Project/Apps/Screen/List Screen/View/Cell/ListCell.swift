//
//  ListCell.swift
//  Moolecole Project
//
//  Created by Nur Irfan Pangestu on 11/11/19.
//  Copyright © 2019 moolecole.test. All rights reserved.
//

import UIKit
import AlamofireImage

class ListCell: UITableViewCell {
    
    @IBOutlet weak var imgList: UIImageView!
    @IBOutlet weak var titleList: UILabel!
    
    var song: ListModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setDataToCell(_ song: ListModel){
        
        self.song = song
        
        self.titleList.text = song.description
    }
    
}
