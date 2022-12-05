//
//  UIButton+Extension.swift
//  E-Commerce App
//
//  Created by sherif on 05/12/2022.
//

import UIKit

extension UIButton
{
    func shopifyBtn (title : String)
    {
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor(named: "specialYello")
        self.tintColor = .black
        
        //set smaller font size for small devices
        var fontSize : CGFloat = 18
        if UIScreen.main.nativeBounds.height < 1700
        {fontSize = 15}
        
        self.setAttributedTitle(NSAttributedString(string: title,attributes:[NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: fontSize)]), for: .normal)
    }
}
