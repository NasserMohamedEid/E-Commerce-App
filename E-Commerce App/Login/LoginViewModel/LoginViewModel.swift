//
//  LoginViewModel.swift
//  E-Commerce App
//
//  Created by sherif on 04/12/2022.
//

import Foundation


class LoginViewModel {
    
    
    var bindResultToLoginView : (() -> ()) = {}
    
    var result :userCustomer?{
        
        didSet{
            bindResultToLoginView()
        }
    }
    
    
    func getUser(userId:String){
        NetworkManager.getUser(id: userId) { userResponse, error in
            
            self.result = userResponse
        }
        
    }
    
    
    
    
}
