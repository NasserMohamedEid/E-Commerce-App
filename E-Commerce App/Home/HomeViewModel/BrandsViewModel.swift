//
//  BrandsViewModel.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import Foundation

class BrandsViewModel {
    
    var bindingBrandsResult : (()->()) = {}
    var brandssData:Brands? {
        didSet{
            bindingBrandsResult()
        }
    }
    var networkManager:Networking
    
    init(networkManager:Networking){
        self.networkManager = networkManager
        getBrands()
    }
    
    
    func getBrands(){

        let url  = Route.baseUrl + Route.fetchBrands.description
        networkManager.fetchData(url: url) {[weak self] (Brands: Brands?, error) in
            if let error = error {
                print(error)
            }else{
                self?.brandssData = Brands
            }
        }
    }
    
    
    
}
