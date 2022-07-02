//
//  CustomerModel.swift
//  E-Commerce App
//
<<<<<<< HEAD
//  Created by Ahmed Hamam on 02/07/2022.
=======
//  Created by Ahmed Hamam on 01/07/2022.
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
//

import Foundation

struct User: Decodable {

<<<<<<< HEAD
    let customer: Customerr   //
}

struct Customerr: Decodable {
=======
    let customer: Customer
}

struct Customer: Decodable {
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0

    let firstName: String?
    let lastName: String?
    let email: String?
    let phone: String?
    let verifiedEmail: Bool?
    let addresses: [Addresses]?
    
}

struct Addresses: Decodable {

    let address1: String?
    let city: String?
    let province: String?
    let phone: String?
    let zip: String?
    let lastName: String?
    let firstName: String?
    let country: String?
    
  
}
