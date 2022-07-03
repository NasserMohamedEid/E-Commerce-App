//
//  NetworkManager.swift
//  E-Commerce App
//
//  Created by Nasser Mohamed on 22/06/2022.
//

import Foundation
import Alamofire

class NetworkManager{
    
    
    
    static func fetchBrands(completionHandler: @escaping(Brands?)-> Void){
        let brandsUrl : String = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/smart_collections.json"
        AF.request(brandsUrl, method: .get, encoding: URLEncoding.queryString)
            .responseDecodable(of: Brands.self) { response in
                guard let brandsRespone = response.value else {return}
                completionHandler(brandsRespone)
            }
        
    }
    
    static func fetchproducts(collectionId : Int, completionHandler :@escaping(ProductsBrand?)->Void){
        let productUrl = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/collections/\(collectionId)/products.json"
        AF.request(productUrl, method: .get,encoding: URLEncoding.queryString).responseDecodable(of:ProductsBrand.self) { response in
            print(response)
            guard let productResponse = response.value else{return}
            completionHandler(productResponse)
        }
    }
    
    
    
    
    
    
    
    static func fetchCategoryApi(id:Int,complitionHandler : @escaping (CategoryModel?) -> Void){
        let url:String="https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/collections/"+String(id)+"/products.json"
        AF.request(url).responseDecodable(of:CategoryModel.self){
            response in
            guard let categoryProduct=response.value else{return}
            complitionHandler(categoryProduct)
        }
    }
    
    
    static func createAddress(customerID : Int , completionHandler: @escaping(Address?)-> Void){
        
        let parametrs:Parameters = [
            "address":["address1":"1 Rue des Carrieres","address2":"Suite 1234","city":"Montreal","company":"Fancy Co.","first_name":"Samuel","last_name":"de Champlain","phone":"819-555-5555","province":"Quebec","country":"Canada","zip":"G1R 4P5","name":"Samuel de Champlain","province_code":"QC","country_code":"CA","country_name":"Canada" ]
            
        ]
        
        let headers:HTTPHeaders = ["X-Shopify-Access-Token":"{access_token}","Content-Type":"application/json"]
        let addressUrl = "https://@menofia-2022-q3.myshopify.com/admin/api/2022-04/customers/\(customerID)/addresses.json"
        AF.request(addressUrl, method: .post, parameters: parametrs, encoding: JSONEncoding.default, headers: headers).responseDecodable(of: Address.self) { response in
            print(response)
            guard let response = response.value else {return}
            print(response)
            completionHandler(response)
            
        }
        
        
    }
    
    static func fetchProductDetails(id:Int,completionHandler:@escaping (ProductDetails?)->Void){
        let baseUrl:String = "https://fde429753a207f610321a557c2e0ceb0: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@menofia-2022-q3.myshopify.com/admin/api/2022-04/products/\(id).json"
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
    
    static func createUser(firstName:String ,lastName:String, email:String, password:String, configPassword:String , completionHandler:@escaping (PostUser)->Void){
        let parameters : Parameters = ["customer":["first_name":"\(firstName)","last_name":"\(lastName)","email":"\(email)","phone":"+11230544171","verified_email":true,"addresses":[["address1":"123 Oak St","city":"\(password)","province":"\(configPassword)","phone":"555-1212","zip":"123 ABC","last_name":"Lastnameson","first_name":"Mother","country":"CA"]]]]
        let baseUrl : String = "https://menofia-2022-q3.myshopify.com/admin/api/2022-04/customers.json"
        let headers:HTTPHeaders = ["X-Shopify-Access-Token": "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","Content-Type": "application/json"]
        AF.request(baseUrl, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseDecodable(of:PostUser.self) {
            response in
           // print(response.data)
            switch response.result{
            case .success(_):
                
               // let jsonData = response.data
               // let Decoder = JSONDecoder()
                guard let data = response.data else{return}
                do{
                    let user = try JSONDecoder().decode(PostUser.self, from: data)
                    
                  //  print(user.customer.id )

                                       completionHandler(user)
                
                } catch let error {
                    print(error.localizedDescription)
                }
                
                print(response)
                break
                
            case .failure :
                print("fail")
                break
            }
            
            
        }
        
    }
}
