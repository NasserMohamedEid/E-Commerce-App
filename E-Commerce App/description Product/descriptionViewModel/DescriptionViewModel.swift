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
    
//
//    var resultOrd : Order?{
//        didSet{
//            bindResultToDescriptionView()
//
//        }
//    }
    
    func getItems(id:Int){

        let url = Route.baseUrl + Route.fetchProductDetils(id).description
        NetworkManager.fetchData(url: url) { [weak self](productDetails: ProductDetails?,error ) in
            if let error = error {
                print(error)
            }else{
                self?.result = productDetails?.product
            }
        }
   }
//    func addToCartPost(){
//        NetworkManager.addToCart { [weak self] resultOrd in
//            guard let self = self else{return}
//            self.resultOrd = resultOrd?.order
//
//
//        }
//
//    }
    
    
}
