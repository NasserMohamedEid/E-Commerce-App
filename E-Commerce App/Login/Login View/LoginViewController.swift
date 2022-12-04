//
//  LoginViewController.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 29/06/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var user:newCustomer?
    var loginVM = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        loginVM.bindResultToLoginView = {[weak self] in
            
            guard let self =  self else {return}
            
            guard let email = self.emailTextField.text?.trimmed,!email.isEmpty,let password = self.passwordTextField.text,!email.isEmpty else {return}
            
            
        }
        
        loginVM.getUser(userId: "\(String(describing: user?.id))")
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
    }
    
    @IBAction func backTOMeButton(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
    
}
