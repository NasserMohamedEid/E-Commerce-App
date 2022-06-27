//
//  NetworkManager.swift
//  E-Commerce App
//
//  Created by Nasser Mohamed on 22/06/2022.
//

import Foundation
import Alamofire
class NetworkManager{
  
    static func fetchCategoryApi(id:Int,complitionHandler : @escaping (CategoryModel?) -> Void){
let url:String="https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/collections/"+String(id)+"/products.json"
            AF.request(url).responseDecodable(of:CategoryModel.self){
                response in
                guard let categoryProduct=response.value else{return}
                complitionHandler(categoryProduct)
            }
        }
}
