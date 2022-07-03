//
//  CustomerFailModel.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 02/07/2022.
//

import Foundation
//
//struct Error: Codable {
//
//    let errors: Errors?
//
//}
//
//struct Errors: Codable {
//
//    let email: [String]?
//    let phone: [String]?
//
//}

//struct PostUser: Decodable {
//
//    let customer: [Customerss]?
//
//}
//
//
//struct Customerss: Decodable {
//
//    let id: Int?
//    let email: String?
//    let acceptsMarketing: Bool?
//    let createdAt: String?
//    let updatedAt: String?
//    let firstName: String?
//    let lastName: String?
//    let ordersCount: Int?
//    let state: String?
//    let totalSpent: String?
//    let lastOrderId: String?
//    let note: String?
//    let verifiedEmail: Bool?
//    let multipassIdentifier: String?
//    let taxExempt: Bool?
//    let phone: String?
//    let tags: String?
//    let lastOrderName: String?
//    let currency: String?
//    let addresses: [Addressess]?
//
//}
//
//struct Addressess: Decodable {
//
//    let id: Int?
//    let customerId: Int?
//    let firstName: String?
//    let lastName: String?
//    let company: String?
//    let address1: String?
//    let address2: String?
//    let city: String?
//    let province: String?
//    let country: String?
//    let zip: String?
//    let phone: String?
//    let name: String?
//    let provinceCode: String?
//    let countryCode: String?
//    let countryName: String?
//    let defaultField: Bool?
//
//}

struct PostUser: Codable {
    let customer: Customere
}


struct Customere: Codable {
    let id: Int?
    let email: String?
    let acceptsMarketing: Bool?
    let createdAt, updatedAt: Date?
    let firstName, lastName: String?
    let ordersCount: Int?
    let state, totalSpent: String?
    let lastOrderID, note: String?
    let verifiedEmail: Bool?
    let multipassIdentifier: String?
    let taxExempt: Bool?
    let phone, tags: String?
    let lastOrderName: String?
    let currency: String?
    let addresses: [Addrese]?
    let acceptsMarketingUpdatedAt: Date?
    let marketingOptInLevel: String?
   
   

    enum CodingKeys: String, CodingKey {
        case id, email
        case acceptsMarketing = "accepts_marketing"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case firstName = "first_name"
        case lastName = "last_name"
        case ordersCount = "orders_count"
        case state
        case totalSpent = "total_spent"
        case lastOrderID = "last_order_id"
        case note
        case verifiedEmail = "verified_email"
        case multipassIdentifier = "multipass_identifier"
        case taxExempt = "tax_exempt"
        case phone, tags
        case lastOrderName = "last_order_name"
        case currency, addresses
        case acceptsMarketingUpdatedAt = "accepts_marketing_updated_at"
        case marketingOptInLevel = "marketing_opt_in_level"
      
    }
}


struct Addrese: Codable {
    let id, customerID: Int?
    let firstName, lastName: String?
    let address1: String?
    let city, province, country, zip: String?
    let phone, name, provinceCode, countryCode: String?
    let countryName: String?
    let addressDefault: Bool?

    enum CodingKeys: String, CodingKey {
        case id
        case customerID = "customer_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case address1, city, province, country, zip, phone, name
        case provinceCode = "province_code"
        case countryCode = "country_code"
        case countryName = "country_name"
        case addressDefault = "default"
    }
}
