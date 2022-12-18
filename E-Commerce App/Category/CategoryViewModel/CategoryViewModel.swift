//
//  CategoryViewModel.swift
//  E-Commerce App
//
//  Created by Nasser Mohamed on 23/06/2022.
//

import Foundation
class CategoryViewModel {
    
    
    var bindResultToHomeView : (() -> ()) = {}
    
    
    var result : [Products]?{
        didSet{
            bindResultToHomeView()
        }
    }
    
    func getItems(id:Int){

        let url  =  Route.baseUrl + Route.fetchProductsAndCategories(id).description
        NetworkManager.fetchData(url: url) { [weak self] (productCategory:CategoryModel?, error)in
            if let error = error {
                 print(error)
            }else{
                self?.result = productCategory?.products
            }
        }
}
}
