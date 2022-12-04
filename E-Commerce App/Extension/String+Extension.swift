//
//  String+Extension.swift
//  E-Commerce App
//
//  Created by sherif on 04/12/2022.
//

import Foundation



extension String{
    
    var trimmed:String {
        
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

}
