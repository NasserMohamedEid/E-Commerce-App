//
//  categoryModel.swift
//  E-Commerce App
//
//  Created by Nasser Mohamed on 23/06/2022.
//

import Foundation
struct CategoryModel:Decodable{
    var products:[Products]?
}
struct Products:Decodable{
   // var id:Int64
    var title:String?
    var vendor:String?
    var product_type: String?
    var images: [Images]?
                   
                       
}
struct Images:Decodable{
    var src:String?
}

