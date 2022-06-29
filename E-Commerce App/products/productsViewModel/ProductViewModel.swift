//
//  ProductViewModel.swift
//  E-Commerce App
//
//  Created by sherif on 29/06/2022.
//

import Foundation


class ProductViewModel {
    
    let services:NetworkManager
    var bindingProductResult : (()->()) = {}
    var productsData:Products?
    
    
    
    init(services: NetworkManager) {
        self.services = services
    }
    
    
    
    
    func getProducts(brandId :Int){
        
        NetworkManager.fetchproducts(collectionId: brandId) {[weak self] productResponse in
            guard let self = self else{return}
            self.productsData = productResponse
            self.bindingProductResult()
        }
        
        
    }
}
