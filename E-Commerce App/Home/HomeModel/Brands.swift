//
//  Brands.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import Foundation


struct Brands : Decodable {

    let  smartCollections: [SmartCollections]?
    enum CodingKeys: String, CodingKey {
          case smartCollections = "smart_collections"
      }
}

struct SmartCollections: Decodable {

    let id: Int??
    let handle: String?
    let title: String?
    let updatedAt: String?
    let bodyHtml: String?
    let publishedAt: String?
    let sortOrder: String?
    let templateSuffix: String?
    let disjunctive: Bool?
    let rules: [Rules]?
    let publishedScope: String?
    let adminGraphqlApiId: String?
    let image: Image?

    enum CodingKeys: String, CodingKey {
           case id, handle, title
           case updatedAt = "updated_at"
           case bodyHtml = "body_html"
           case publishedAt = "published_at"
           case sortOrder = "sort_order"
           case templateSuffix = "template_suffix"
           case disjunctive, rules
           case publishedScope = "published_scope"
           case adminGraphqlApiId = "admin_graphql_api_id"
           case image
       }
}


struct Rules: Decodable {

    let column: String?
    let relation: String?
    let condition: String?

}


struct Image: Decodable {

    let createdAt: String?
    let alt: String?
    let width: Int?
    let height: Int?
    let src: String?

    enum CodingKeys: String, CodingKey {
            case createdAt = "created_at"
            case alt, width, height, src
        }
    
}


enum Column: String, Decodable {
    case title = "title"
}

enum Relation: String, Decodable {
    case contains = "contains"
}

enum SortOrder: String, Decodable {
    case bestSelling = "best-selling"
}
