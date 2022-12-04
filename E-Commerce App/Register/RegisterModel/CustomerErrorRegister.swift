//
//  CustomerErrorRegister.swift
//  E-Commerce App
//
//  Created by sherif on 28/11/2022.
//

import Foundation


struct CustomerErrorModel: Codable
{
    var errors: Errors?
}

// MARK: - Errors
struct Errors: Codable
{
    var email, phone: [String]?
}
