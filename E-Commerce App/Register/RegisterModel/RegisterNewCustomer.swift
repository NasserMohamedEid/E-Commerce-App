//
//  RegisterNewCustomer.swift
//  E-Commerce App
//
//  Created by sherif on 28/11/2022.
//

import Foundation


struct userCustomer: Codable {
    
    let customers: [newCustomer]?
}


struct newCustomer: Codable {

        let id: Int?
        let email: String?
        let acceptsMarketing: Bool?
        let createdAt: String?
        let updatedAt: String?
        let firstName: String?
        let lastName: String?
        let ordersCount: Int?
        let state: String?
        let totalSpent: String?
        let lastOrderId: String?
    
    //  note for password Field
    
        let note: String?
        let verifiedEmail: Bool?
        let multipassIdentifier: String?
        let taxExempt: Bool?
        let tags: String?
        let lastOrderName: String?
        let currency: String?
        let phone: String?
        let addresses: [Addresses]?
      
    
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
           case lastOrderId = "last_order_id"
           case note
           case verifiedEmail = "verified_email"
           case multipassIdentifier = "multipass_identifier"
           case taxExempt = "tax_exempt"
           case tags
           case lastOrderName = "last_order_name"
           case currency, phone, addresses
           
       }

}

struct Addresses: Codable {

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
        let addressDefault: Bool?
    
    
    
    enum CodingKeys: String, CodingKey {
        
           case id
           case customerId = "customer_id"
           case firstName = "first_name"
           case lastName = "last_name"
           case company, address1, address2, city, province, country, zip, phone, name
           case provinceCode = "province_code"
           case countryCode = "country_code"
           case countryName = "country_name"
           case addressDefault = "default"
       }

}
