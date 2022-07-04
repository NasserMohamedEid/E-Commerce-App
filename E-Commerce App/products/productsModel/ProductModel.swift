//
//  ProductModel.swift
//  E-Commerce App
//
//  Created by sherif on 29/06/2022.
//

import Foundation



struct ProductsBrand: Codable {

    let products: [products]

}


struct products: Codable {

    let id: Int?
    let title: String?
    let vendor: String?
    let productType: String?
    let status: String?
    let publishedScope: String?
    let options: [Options]?
    let images: [ImagesBrand]?
    let variants: [Variants]?

    
    enum CodingKeys: String, CodingKey {
           case id, title
           case vendor
           case productType = "product_type"
           case status
           case publishedScope = "published_scope"
           case  variants,options, images
       }
    
}

struct Variants: Codable {

    let id: Int?
    let productId: Int?
    let title: String?
    let price: String?

}

struct Options: Codable {

    let id: Int?
    let productId: Int?
    let name: String?
    let position: Int?
    let values: [String]?

    enum CodingKeys: String, CodingKey {
           case id
           case productId = "product_id"
           case name, position, values
       }
    
    
}

struct ImagesBrand: Codable {

    let id: Int?
    let productId: Int?
    let position: Int?
    let createdAt: String?
    let updatedAt: String?
    let alt: String?
    let width: Int?
    let height: Int?
    let src: String?
    let variantIds: [String]?
    let adminGraphqlApiId: String?

}



