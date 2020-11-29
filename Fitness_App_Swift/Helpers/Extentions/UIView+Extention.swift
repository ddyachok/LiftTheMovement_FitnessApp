//
//  UIViewExtention.swift
//  Fitness_App_Swift
//
//  Created by Daniel Dyachok on 19.10.2020.
//

import UIKit

extension UIView {
    /// This function will add a layer on any `UIView` to make that `UIView` look darkened
    func addoverlay(color: UIColor = .black,alpha : CGFloat = 0.6) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints                             = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive           = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive   = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive     = true
        
    }
    
}

extension UIFont {
    class Abel {
        func regular (with size: CGFloat) -> UIFont? {
            UIFont(name: "Abel-Regular", size: size)
        }
        func bold(with size: CGFloat) -> UIFont? {
            UIFont(name: "AbelPro-Bold", size: size)
        }
    }
}
