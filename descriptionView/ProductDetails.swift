//
//  ProductDetails.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 25/06/2022.
//

import Foundation

struct ProductDetails : Decodable{
    let product: Product
}

struct Product : Decodable{
    let id: Int
    let title: String
    let body_html: String
    let vendor: String
    let images: [Images]
    let variants: [Variants]
}

struct Images : Decodable{
    var src: String
}

struct Variants: Decodable {
    let price: String
}

//struct ProductCart : Encodable {
//    let title: String
//    let images: [Images]
//    let variants: [Variants]
//}
