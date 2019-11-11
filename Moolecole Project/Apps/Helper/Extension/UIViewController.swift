//
//  UIViewController.swift
//  Moolecole Project
//
//  Created by Nur Irfan Pangestu on 11/11/19.
//  Copyright © 2019 moolecole.test. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func setupHideKeyboardWhenTappedAround() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:    #selector(UIViewController.dismissThisKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissThisKeyboard() {
        view.endEditing(true)
    }
    
    func setDefaultTitle(title: String = "") {
        self.title = title
    }
    
    func setHideToolbar() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func setScreenPush(vc: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    func setScreenPresent(vc: UIViewController, animated: Bool, UIPresentationStyle: UIModalPresentationStyle) {
        let rootVC = UINavigationController(rootViewController: vc)
        rootVC.modalPresentationStyle = UIPresentationStyle
        self.present(rootVC, animated: animated, completion: nil)
    }
    
    func setScreenDismissPresent(animated: Bool) {
        self.dismiss(animated: animated, completion: nil)
    }
    
    func setNavigationBarHidden() {
        navigationController?.setNavigationBarHidden(true, animated: true)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
    
    func showToast(message : String, font: UIFont = UIFont.systemFont(ofSize: 20, weight: .light)) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
