//
//  RegisterViewController.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 02/07/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerImage: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailInTextField: UITextField!
    
    @IBOutlet weak var passwordInTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    var registerViewModel : RegisterViewModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerViewModel = RegisterViewModel()
    }
    

    @IBAction func makeRegisterButton(_ sender: UIButton) {
        registerViewModel.bindResultToRegisterView = {[weak self]in}
        registerViewModel.createCustomer(name: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailInTextField.text ?? "", password: passwordInTextField.text ?? "", configPassword: confirmPasswordTextField.text ?? "")
    }
    
    @IBAction func backMeScreenButton(_ sender: UIButton) {
    }
    
}
