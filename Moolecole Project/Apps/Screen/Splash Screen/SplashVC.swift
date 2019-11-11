//
//  SplashVC.swift
//  Moolecole Project
//
//  Created by Nur Irfan Pangestu on 11/11/19.
//  Copyright © 2019 moolecole.test. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setHideToolbar()
        self.setScreenPresent(vc: ListVC(), animated: true, UIPresentationStyle: .fullScreen)
    }
}
