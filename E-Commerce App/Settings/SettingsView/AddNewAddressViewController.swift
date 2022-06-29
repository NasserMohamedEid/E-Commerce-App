//
//  AddNewAddressViewController.swift
//  E-Commerce App
//
//  Created by sherif on 27/06/2022.
//

import UIKit

class AddNewAddressViewController: UIViewController {

    var addressViewModel:AddressViewModel?
    
    
    @IBOutlet weak var phoneTextfiled: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var addAddressOutlet: UIButton!{
        didSet{
            addAddressOutlet.layer.cornerRadius = addAddressOutlet.layer.frame.height / 2
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addressViewModel = AddressViewModel(services: NetworkManager())
       
        
    }
    
    

    @IBAction func addAddressButtonPressed(_ sender: UIButton) {
        
        addressViewModel?.createAddress(customerId: 6073738035371, address: addressTextField.text ?? "", city: cityTextField.text ?? "", country: countryTextField.text ?? "" , phone:phoneTextfiled.text ?? "" )
        
        
    }
}
