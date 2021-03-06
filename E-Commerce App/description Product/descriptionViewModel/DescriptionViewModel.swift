//
//  DescriptionViewModel.swift
//  E-Commerce App
//

//  Created by Ahmed Hamam on 24/06/2022.


import Foundation


class DescriptionViewModel {
    
    
    var bindResultToDescriptionView : (() -> ()) = {}
    var orderList : Order?
    
    var result : Product?{
        didSet{
            bindResultToDescriptionView()
        }
    }
    
    var resultOrd : Order?{
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
    func addToCartPost(){
        NetworkManager.addToCart { [weak self] resultOrd in
            guard let self = self else{return}
            self.resultOrd=resultOrd?.order
            print(resultOrd ?? "")
            
        }
    }
}
