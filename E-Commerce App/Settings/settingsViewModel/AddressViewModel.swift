//
//  AddressViewModel.swift
//  E-Commerce App
//
//  Created by sherif on 28/06/2022.
//

import Foundation

class AddressViewModel {
    
    let services:NetworkManager
    var bindingAddress : (()->()) = {}
    var addressData:Address?{
        didSet{
            bindingAddress()
        }
    }
  
    init(services: NetworkManager) {
        self.services = services
    }
    
    
    func createAddress(customerId :Int,address:String,city:String,country:String,phone:String){
        
        NetworkManager.createAddress(customerID: customerId) { [weak self] addressResponse in
            guard let self = self else{return}
            
            self.addressData = addressResponse
            self.bindingAddress()
        }
        
    }
    
    
}
