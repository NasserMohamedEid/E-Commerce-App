//
//  LoginViewModel.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 04/07/2022.
//

import Foundation

class LoginViewModel {
    
    var bindResultToLoginView : (() -> ()) = {}
    

    var result :[Customerss]?{

        didSet{
            bindResultToLoginView()
        }
    }
    

    func fetchCustomer(){
        NetworkManager.fetchcustomer { users in
            self.result=users.customers
        }
    }
    }
