//
//  RegisterViewModel.swift
//  E-Commerce App
//

//  Created by Ahmed Hamam on 01/07/2022.


import Foundation

class RegisterViewModel {
    
    var bindResultToRegisterView : (() -> ()) = {}
    
    var result :userCustomer?{
        
        didSet{
            bindResultToRegisterView()
        }
    }
    
    func createCustomer(name:String, lastName:String, email:String, password:String, phone:String){
        
        NetworkManager.createUser(firstName: name, lastName: lastName, email: email, password: password, phone:phone) { response, error in

            self.result = response
            print("Success")
        }
        
    }
}

