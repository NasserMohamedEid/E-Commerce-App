//
//  RegisterViewModel.swift
//  E-Commerce App
//
<<<<<<< HEAD
//  Created by Ahmed Hamam on 02/07/2022.
=======
//  Created by Ahmed Hamam on 01/07/2022.
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
//

import Foundation

class RegisterViewModel {
    
    var bindResultToRegisterView : (() -> ()) = {}
    
<<<<<<< HEAD
    var result :Customerr?{
=======
    var result :Customer?{
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
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
<<<<<<< HEAD
=======
    

>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
