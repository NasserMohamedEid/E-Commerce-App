//
//  BrandsViewModel.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import Foundation



class BrandsViewModel {
    
    let  services:NetworkManager
    var bindingBrandsResult : (()->()) = {}
    var brandsData:Brands?
    
    init(services: NetworkManager) {
        self.services = services
    }

    
    
    func getBrands(){
        
        NetworkManager.fetchBrands { [weak self] brandsResponse in
            guard let self = self else{return}
            self.brandsData = brandsResponse
            self.bindingBrandsResult()
        }
    }
    
    
    
}
