//
//  LoginViewModel.swift
//  E-Commerce App
//
//  Created by sherif on 04/12/2022.
//

import Foundation


class LoginViewModel {
    
    
    var bindResultToLoginView : (() -> ()) = {}
    var message:String?
    var islooged:Bool?
    
    var result :userCustomers?{
        
        didSet{
            bindResultToLoginView()
        }
    }
    
    
    func getUser(email:String,password:String){
        
        NetworkManager.loginUser(email: email, password: password) {[weak self] resultMessage,loggedIn in
            self?.message = resultMessage
            self?.islooged = loggedIn
            self?.bindResultToLoginView()
        }
    }
    
    
    
    
}
