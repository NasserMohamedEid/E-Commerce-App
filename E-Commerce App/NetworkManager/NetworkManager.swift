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
        
        let url  = Route.baseUrl + Route.fetchBrands.description
        AF.request(url, method: .get, encoding: URLEncoding.queryString)
            .responseDecodable(of: Brands.self) { response in
                guard let brandsRespone = response.value else {return}
                completionHandler(brandsRespone)
            }
        
    }
    
    static func fetchproducts(collectionId : Int, completionHandler :@escaping(ProductsBrand?)->Void){
        
        
        let url  = Route.baseUrl + Route.fetchProductsAndCategories(collectionId).description
        AF.request( url, method: .get,encoding: URLEncoding.queryString).responseDecodable(of:ProductsBrand.self) { response in
            guard let productResponse = response.value else{return}
            completionHandler(productResponse)
        }
    }

    
    
    static func fetchProductDetails(id:Int,completionHandler:@escaping (ProductDetails?)->Void){

        let url = Route.baseUrl + Route.fetchProductDetils(id).description
        AF.request(url, method: .get).responseDecodable(of:ProductDetails.self){
            response in
            guard let descriptionProduct=response.value else{return}
            print(descriptionProduct.product.title)
            completionHandler(descriptionProduct)
        }
    }
    
    
    
    static func fetchCategoryApi(id:Int,complitionHandler : @escaping (CategoryModel?) -> Void){

        let url  =  Route.baseUrl + Route.fetchProductsAndCategories(id).description
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

    
    static func addToCart(completionHandler:@escaping (OrderRequest?)->Void){
        
        
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
    
    static func createUser(firstName:String,lastName:String,email:String,password:String, phone:String,completionHandler:@escaping (newCustomer?,customerErrorModel?)->Void){
        
//        let baseUrl : String = "https://menofia-2022-q3.myshopify.com/admin/api/2022-04/customers.json"
        
        let url  =  Route.baseUrl + Route.createCustomer.description
        
        let param :Parameters = ["customer":["first_name":"\(firstName)","last_name":"\(lastName)","email":"\(email)","phone":"+\(phone)","verified_email":true,"addresses":[["address1":"123 Oak St","city":"Ottawa","province":"ON","phone":"555-1212","zip":"123 ABC","last_name":"Lastnameson","first_name":"Mother","country":"CA"]],"password":"\(password)","password_confirmation":"\(password)","send_email_welcome":false]]
        
         let headers:HTTPHeaders = [
                    "X-Shopify-Access-Token":
                          "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",
                            "Content-Type": "application/json"]
        
        AF.request(url, method: .post, parameters: param,encoding: JSONEncoding.default, headers: headers).responseDecodable(of:newCustomer.self) {
            response in
           // print(response.data)
            switch response.result{
            case .success(_):
                
               // let jsonData = response.data
               // let Decoder = JSONDecoder()
                guard let data = response.data else{return}
                
                do{
                    let user = try JSONDecoder().decode(newCustomer.self, from: data)
                    completionHandler(user,nil)
                } catch let error {
                    print(error)
                }
            case .failure(let error) :
                print(error)
                break
            }
            
            
        }
        
    }
}
