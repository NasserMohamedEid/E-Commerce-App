//
//  RegisterViewController.swift
//  E-Commerce App
//

//  Created by Ahmed Hamam on 29/06/2022.


import UIKit


class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerImageView: UIImageView!{
        didSet{
            registerImageView.image = UIImage(named: "shop")
        }
    }
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailInTextField: UITextField!
    @IBOutlet weak var passwordInTextField: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    
    var registerVM =  RegisterViewModel()
    var customer:newCustomer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func makeRegisterButton(_ sender: UIButton) {
        
        guard let fisrt = firstNameTextField.text?.trimmed ,!fisrt.isEmpty,
        let lastName =  lastNameTextField.text?.trimmed,!lastName.isEmpty,
        let email = emailInTextField.text?.trimmed ,!email.isEmpty ,
        let password =  passwordInTextField.text,!password.isEmpty,
        let phone = phoneTF.text,!phone.isEmpty else {return}
        
        registerVM.createCustomer(name: fisrt, lastName: lastName, email: email, password: password, phone: phone)
        
        registerVM.bindResultToRegisterView = {
            DispatchQueue.main.async {
                
        
                }
            }
    }

    
    @IBAction func backMeScreenButton(_ sender: UIButton) {
        
       // self.dismiss(animated: true)
    }
    
    
    
    
    
    
}
