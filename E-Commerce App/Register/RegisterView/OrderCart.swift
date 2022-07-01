//
//  OrderCart.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 01/07/2022.
//

import Foundation

struct OrderRequest: Codable {

    let order: Order
}

struct Order: Codable {

    let lineItems: [LineItems]
}

struct LineItems: Codable {

    let variantId: Int
    let quantity: Int
}


//struct DraftClass: Codable {
//
//    let draftOrder: DraftOrder
//}
//
//struct DraftOrder: Codable {
//
//    let lineItems: [LineItems]
//    let tags: String
//}
//struct LineItems: Codable {
//
//    let variantId: Int
//    let quantity: Int
//}
