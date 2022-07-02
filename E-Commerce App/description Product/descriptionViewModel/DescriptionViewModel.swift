//
//  DescriptionViewModel.swift
//  E-Commerce App
//
<<<<<<< HEAD
//  Created by Ahmed Hamam on 02/07/2022.
=======
//  Created by Ahmed Hamam on 24/06/2022.
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
//

import Foundation

<<<<<<< HEAD
=======

>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
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
