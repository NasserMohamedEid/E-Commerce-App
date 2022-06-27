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
        NetworkManager.fetchCategoryApi(id: id, complitionHandler: {
            [weak self](result)in
            
            self?.result=result?.products
        })
    
}
}
