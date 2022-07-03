//
//  ProductDetails.swift
//  E-Commerce App
//

//  Created by Ahmed Hamam on 25/06/2022.


import Foundation

struct ProductDetails : Decodable{    //product hyb2a productDetails
    let product: Product
}

struct Product : Decodable{  // productDetails
    let id: Int
    let title: String
    let body_html: String
    let vendor: String
    let images: [Imagess]
    let variants: [Variants1]
}


struct Imagess : Decodable{
    var src: String
}

struct Variants1: Decodable {
    let product_id : Int
    let id: Int
    let title: String
    let price : String
    let position : Int
}

