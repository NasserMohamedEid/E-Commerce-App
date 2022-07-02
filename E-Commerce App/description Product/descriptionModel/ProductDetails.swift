//
//  ProductDetails.swift
//  E-Commerce App
//
<<<<<<< HEAD
//  Created by Ahmed Hamam on 02/07/2022.
=======
//  Created by Ahmed Hamam on 25/06/2022.
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
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
<<<<<<< HEAD
    let images: [Imagess]
    let variants: [Variants]
}

struct Imagess : Decodable{
=======
    let images: [Images]
    let variants: [Variants]
}

struct Images : Decodable{
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
    var src: String
}

struct Variants: Decodable {
    let product_id : Int
    let id: Int
    let title: String
    let price : String
    let position : Int
}
<<<<<<< HEAD
=======



>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
