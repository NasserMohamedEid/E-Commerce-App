//
//  RegisterViewModel.swift
//  E-Commerce App
//

//  Created by Ahmed Hamam on 01/07/2022.


import Foundation

class RegisterViewModel {
    
    var bindResultToRegisterView : (() -> ()) = {}
    

    var result :Customere?{

        didSet{
            bindResultToRegisterView()
        }
    }
    
    func createCustomer(name:String, lastName:String, email:String, password:String, configPassword:String){
        NetworkManager.createUser(firstName: name, lastName: lastName, email: email, password: password, configPassword: configPassword) { userData in
            self.result=userData.customer
        }
        
        }
    }

