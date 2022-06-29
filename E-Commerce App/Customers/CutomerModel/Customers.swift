//
//  Customers.swift
//  E-Commerce App
//
//  Created by sherif on 28/06/2022.
//

import Foundation

struct Customers: Codable {
    
    let customers: [Customer]
}

// MARK: - Customer
struct Customer: Codable {
    
    let id: Int
    let email: String
    let createdAt, updatedAt: Date
    let firstName, lastName: String?
    let ordersCount: Int
    let state: String
    let totalSpent: String
    let lastOrderId: Int?
    let note: String
    let verifiedEmail: Bool
    let multipassIdentifier: String?
    let taxExempt: Bool
    let phone: String?
    let tags: String
    let lastOrderName: String?
    let currency: String
    let addresses: [Address]
    let defaultAddress: Address?

    enum CodingKeys: String, CodingKey {
        case id, email
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case firstName = "first_name"
        case lastName = "last_name"
        case ordersCount = "orders_count"
        case state
        case totalSpent = "total_spent"
        case lastOrderId = "last_order_id"
        case note
        case verifiedEmail = "verified_email"
        case multipassIdentifier = "multipass_identifier"
        case taxExempt = "tax_exempt"
        case phone, tags
        case lastOrderName = "last_order_name"
        case currency, addresses
        case defaultAddress = "default_address"
    }
}

// MARK: - Address
struct Address: Codable {
    let address1, address2, city, company: String
    let firstName, lastName, phone, province: String
    let country, zip, name, provinceCode: String
    let countryCode, countryName: String

    enum CodingKeys: String, CodingKey {
        case address1, address2, city, company
        case firstName = "first_name"
        case lastName = "last_name"
        case phone, province, country, zip, name
        case provinceCode = "province_code"
        case countryCode = "country_code"
        case countryName = "country_name"
    }
}
