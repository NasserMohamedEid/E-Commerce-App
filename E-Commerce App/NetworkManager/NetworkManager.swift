//
//  NetworkManager.swift
//  E-Commerce App
//
//  Created by Nasser Mohamed on 22/06/2022.
//

import Foundation
import Alamofire
class NetworkManager{
    static func fetchProductDetails(   ,completionHandler:@escaping ()?->Void){
        let baseUrl : String = ""
        let parameters : Parameters = []
        AF.request(baseUrl, method: .get,parameters: parameters, encoding: URLEncoding.queryString, headers: nil).responseDecodable(of:   .self) { <#DataResponse<Decodable, AFError>#> in
            <#code#>
        }
    }
    
}
