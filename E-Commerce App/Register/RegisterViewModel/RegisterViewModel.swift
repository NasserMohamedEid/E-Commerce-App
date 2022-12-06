//
//  RegisterViewModel.swift
//  E-Commerce App
//

//  Created by Ahmed Hamam on 01/07/2022.


import Foundation

class RegisterViewModel {
    
    var bindResultToRegisterView : (() -> ()) = {}
    var error:String?
    var result :userCustomer?{
        
        didSet{
            bindResultToRegisterView()
        }
    }
    
    func createCustomer(name:String, lastName:String, email:String, password:String, phone:String){
        
        NetworkManager.registUser(firstName: name, lastName: lastName, email: email, password: password, phone:phone) { [weak self ] resultResponse, error in

            self?.result = resultResponse
            self?.error = error
        }
        
    }
}

