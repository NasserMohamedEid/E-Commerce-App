//
//  Route.swift
//  E-Commerce App
//
//  Created by sherif on 27/11/2022.
//

import Foundation


enum Route {
    
    static let baseUrl  = "https://\(ApiManager.APIkey):\(ApiManager.password)@\(ApiManager.hostName)admin/api/2022-04"
    
    case fetchBrands
    case fetchProducts(Int)
    case fetchProductDetils(Int)
    
    var description:String {
        
        switch self {
            
        case .fetchBrands:
            return "/smart_collections.json"
        case .fetchProducts(let collectionId):
            return "/collections/\(collectionId)/products.json"
        case .fetchProductDetils(let id):
            return "/products/\(id).json"
        }
        
        
    }
}
