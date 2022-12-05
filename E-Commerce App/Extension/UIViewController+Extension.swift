//
//  UIViewController+Extension.swift
//  E-Commerce App
//
//  Created by sherif on 05/12/2022.
//


import UIKit

extension UIViewController {
    
    static var identifier :String{
        
        return String(describing: self)
    }
    
    
    
    static func instantiateVC()->Self{
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let controller  = storyBoard.instantiateViewController(withIdentifier: identifier)as! Self
        return controller
       
    }
    
}

