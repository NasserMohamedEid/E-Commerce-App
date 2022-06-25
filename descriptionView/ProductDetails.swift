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
}

struct Images : Decodable{
    var src: String
}
