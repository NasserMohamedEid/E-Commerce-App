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
        let baseUrl:String = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/products/\(id).json"
        //"+String(id)+"
        AF.request(baseUrl).responseDecodable(of:ProductDetails.self){
                        response in
                        guard let descriptionProduct=response.value else{return}
            print(descriptionProduct.product.title)
            completionHandler(descriptionProduct)
                    }
    }
    
    static func addToCart(completionHandler:@escaping (OrderRequest? )->Void){
        
        
        let parameters : Parameters = ["order":["line_items":[["variant_id":447654529,"quantity":1]]]]
        let baseUrl:String = "https://menofia-2022-q3.myshopify.com/admin/api/2022-04/orders.json"
        let headers:HTTPHeaders = ["X-Shopify-Access-Token":" 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","Content-Type": "application/json"]
        AF.request(baseUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of:OrderRequest .self){
            response in
            print(response)
            guard let response = response.value else{return}
            completionHandler(response)
    }

    }
    
    static func createUser(firstName:String ,lastName:String, email:String, password:String, configPassword:String , completionHandler:@escaping (User)->Void){
        let parameters : Parameters = ["customer":["first_name":"\(firstName)","last_name":"\(lastName)","email":"\(email)","phone":"+15142546011","verified_email":true,"addresses":[["address1":"123 Oak St","city":"\(password)","province":"\(configPassword)","phone":"555-1212","zip":"123 ABC","last_name":"Lastnameson","first_name":"Mother","country":"CA"]]]]
        let baseUrl : String = "https://menofia-2022-q3.myshopify.com/admin/api/2022-04/customers.json"
        let headers:HTTPHeaders = ["X-Shopify-Access-Token": "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","Content-Type": "application/json"]
        AF.request(baseUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of:User .self){
       response in
            print(response)
            guard let response = response.value else{return}
            completionHandler(response)

}

}

}
