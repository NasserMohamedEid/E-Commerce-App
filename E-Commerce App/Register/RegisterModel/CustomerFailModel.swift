//
//  CustomerFailModel.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 02/07/2022.
//

import Foundation

struct Error: Codable {

    let errors: Errors?

}

struct Errors: Codable {

    let email: [String]?
    let phone: [String]?

}
