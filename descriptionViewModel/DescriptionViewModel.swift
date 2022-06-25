//
//  DescriptionViewModel.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 24/06/2022.
//

import Foundation


class DescriptionViewModel {
    
    
    var bindResultToDescriptionView : (() -> ()) = {}
    
    
    var result : Product?{
        didSet{
            bindResultToDescriptionView()
        }
    }
    
    func getItems(id:Int){
        NetworkManager.fetchProductDetails(id: id, completionHandler: {
            [weak self](result)in
            
            self?.result=result?.product
        })
    
}
}
