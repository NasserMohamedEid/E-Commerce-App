//
//  Users.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 04/07/2022.
//

import Foundation

struct Users: Decodable {

    let customers: [Customerss]?

}

struct Customerss: Decodable {

    let id: Int?
    let email: String?
    let acceptsMarketing: Bool?
    let createdAt: String?
    let updatedAt: String?
    let first_name: String?
    let last_name: String?
    
    let totalSpent: String?
    let lastOrderId: String?
    
    let verifiedEmail: Bool?
    let multipass_identifier: String?
    let taxExempt: Bool?
    let phone: String?
    let tags: String?
    let lastOrderName: String?
    let currency: String?
    let addresses: [Addresses]?
    let acceptsMarketingUpdatedAt: String?
    let marketingOptInLevel: String?
  

  

}

struct Addresses: Decodable {

    let id: Int?
    let customerId: Int?
    let firstName: String?
    let lastName: String?
    let company: String?
    let address1: String?
    let address2: String?
    let city: String?
    let province: String?
    let country: String?
    let zip: String?
    let phone: String?
    let name: String?
    let provinceCode: String?
    let countryCode: String?
    let countryName: String?
    let defaultField: Bool?

}
