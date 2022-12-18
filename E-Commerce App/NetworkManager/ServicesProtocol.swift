//
//  ServicesProtocol.swift
//  E-Commerce App
//
//  Created by sherif on 18/12/2022.
//

import Foundation


protocol ServicesProtocol {
    
    func fetchData<T:Decodable>(url:String,completionHandler: @escaping(T?,Error?)-> Void)
}
