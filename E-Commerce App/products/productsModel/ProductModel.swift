//
//  ProductModel.swift
//  E-Commerce App
//
//  Created by sherif on 29/06/2022.
//

import Foundation



struct Products: Codable {

    let products: [products]

}


struct products: Codable {

    let id: Int?
    let title: String?
    let bodyHtml: String?
    let vendor: String?
    let productType: String?
    let createdAt: String?
    let handle: String?
    let updatedAt: String?
    let publishedAt: String??
    let templateSuffix: String?
    let status: String?
    let publishedScope: String?
    let tags: String?
    let adminGraphqlApiId: String?
    let options: [Options]?
    let images: [Images]?

    
    enum CodingKeys: String, CodingKey {
           case id, title
           case bodyHtml = "body_html"
           case vendor
           case productType = "product_type"
           case createdAt = "created_at"
           case handle
           case updatedAt = "updated_at"
           case publishedAt = "published_at"
           case templateSuffix = "template_suffix"
           case status
           case publishedScope = "published_scope"
           case tags
           case adminGraphqlApiId = "admin_graphql_api_id"
           case  options, images
       }
    
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

struct Images: Codable {

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



