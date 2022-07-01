//
//  ProductDetails.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 25/06/2022.
//

import Foundation

struct ProductDetails : Decodable{    //product hyb2a productDetails
    let product: Product
}

struct Product : Decodable{  // productDetails
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
    let product_id : Int
    let id: Int
    let title: String
    let price : String
    let position : Int
}



