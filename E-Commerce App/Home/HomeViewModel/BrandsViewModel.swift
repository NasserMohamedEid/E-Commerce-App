//
//  BrandsViewModel.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import Foundation



class BrandsViewModel {
    
 
    var bindingBrandsResult : (()->()) = {}
    var brandssData:Brands?
    
//    init(services: NetworkManager) {
////        self.services = services
//    }

    
    
    func getBrands(){
        
        NetworkManager.fetchBrands { [weak self] brandsResponse in
            guard let self = self else{return}
            self.brandssData = brandsResponse
            self.bindingBrandsResult()
        }
    }
    
    
    
}
