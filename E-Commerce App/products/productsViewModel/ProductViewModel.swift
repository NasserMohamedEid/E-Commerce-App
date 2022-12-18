//
//  ProductViewModel.swift
//  E-Commerce App
//
//  Created by sherif on 29/06/2022.
//

import Foundation


class ProductViewModel {
    
    var bindingProductResult : (()->()) = {}
    var productsData:ProductsBrand?{
        didSet{
            bindingProductResult()
        }
    }
    
    
    func getProducts(brandId :Int){
        let url  = Route.baseUrl + Route.fetchProductsAndCategories(brandId).description
        NetworkManager.fetchData(url: url) { [weak self](product: ProductsBrand?,error) in
            if let error = error {
                print(error)
            }else{
                self?.productsData = product
            }
           
        }
    }
}
