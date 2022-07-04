//
//  RegisterViewController.swift
//  E-Commerce App
//

//  Created by Ahmed Hamam on 29/06/2022.


import UIKit
class RegisterViewController: UIViewController {

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
   
        registerImageView.image = UIImage(named:"shop")

    }
    

    @IBAction func makeRegisterButton(_ sender: UIButton) {
        registerViewModel.bindResultToRegisterView = {[weak self]in}
        registerViewModel.createCustomer(name: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailInTextField.text ?? "", password: passwordInTextField.text ?? "", phone: confirmPasswordTextField.text ?? "")
        


        navigationController?.popViewController(animated: true)
    }
    

    


    
    

}
