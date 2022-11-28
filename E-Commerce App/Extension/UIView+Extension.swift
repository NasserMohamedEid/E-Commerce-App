//
//  UIView+Extension.swift
//  E-Commerce App
//
//  Created by sherif on 28/11/2022.
//


import UIKit

extension UIView{
    
    @IBInspectable var cornerRadious : CGFloat {
        get {
            return self.cornerRadious
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
