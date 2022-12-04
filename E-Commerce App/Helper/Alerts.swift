//
//  Alerts.swift
//  E-Commerce App
//
//  Created by sherif on 04/12/2022.
//

import Foundation
import UIKit



class Alerts{
    
    
    static let instance = Alerts()
    
    func showAlert(title:String,message:String)->UIAlertController{
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default))
        return alert
    }
}
