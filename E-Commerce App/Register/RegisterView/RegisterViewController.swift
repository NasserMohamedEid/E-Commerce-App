//
//  RegisterViewController.swift
//  E-Commerce App
//
<<<<<<< HEAD
//  Created by Ahmed Hamam on 02/07/2022.
=======
//  Created by Ahmed Hamam on 29/06/2022.
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
//

import UIKit

class RegisterViewController: UIViewController {
<<<<<<< HEAD

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
    

=======
    @IBOutlet weak var registerImageView: UIImageView!
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
    
    
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
    @IBAction func makeRegisterButton(_ sender: UIButton) {
        registerViewModel.bindResultToRegisterView = {[weak self]in}
        registerViewModel.createCustomer(name: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailInTextField.text ?? "", password: passwordInTextField.text ?? "", configPassword: confirmPasswordTextField.text ?? "")
    }
    
    @IBAction func backMeScreenButton(_ sender: UIButton) {
    }
    
<<<<<<< HEAD
=======

    
    
>>>>>>> 6ff287e5ac3556abde1ec03ce6960a45f8f9eca0
}
