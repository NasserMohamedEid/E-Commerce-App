//
//  NetworkManager.swift
//  E-Commerce App
//
//  Created by Nasser Mohamed on 22/06/2022.
//

import Foundation
import Alamofire
class NetworkManager{
    //7358110630059
    static func fetchProductDetails(id:Int,completionHandler:@escaping (ProductDetails?)->Void){
        let baseUrl:String = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/products/"+String(id)+".json"
        
        AF.request(baseUrl).responseDecodable(of:ProductDetails.self){
                        response in
                        guard let descriptionProduct=response.value else{return}
            print(descriptionProduct.product.title)
            completionHandler(descriptionProduct)
                    }
    }
    
//    static func addToCart( : ,completionHandler:@escaping ( )->Void){
//        let parameters : Parameters = []
//        let baseUrl:String =""
//        AF.request(baseUrl, method: .post, parameters: <#T##Parameters?#>, encoding: JSONEncoding.default, headers: <#T##HTTPHeaders?#>).responseDecodable(of: .self){
//            response in guard let response = response.value else{return}
//            completionHandler(response)
//    }
//
//    }

}
