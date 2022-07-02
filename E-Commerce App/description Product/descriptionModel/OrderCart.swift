//
//  OrderCart.swift
//  E-Commerce App
//
<<<<<<< HEAD
//  Created by Ahmed Hamam on 02/07/2022.
=======
//  Created by Ahmed Hamam on 01/07/2022.
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
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
