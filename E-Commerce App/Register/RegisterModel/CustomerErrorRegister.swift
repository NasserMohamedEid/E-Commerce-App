//
//  CustomerErrorRegister.swift
//  E-Commerce App
//
//  Created by sherif on 28/11/2022.
//

import Foundation





struct customerErrorModel: Decodable {

    let errors: Errors

}
struct Errors:Decodable{
    
    let email: [String]?
    let phone: [String]?
    
}
