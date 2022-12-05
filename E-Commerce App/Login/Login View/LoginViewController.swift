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
        
        self.title = "Login"
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
    
        
        loginVM.bindResultToLoginView = { [weak self] in
            guard let self =  self else {return}
            
            DispatchQueue.main.async { [weak self] in
                
                let alert = Alerts.instance.showAlert(title: "success", message: self?.loginVM.message ?? "")
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    if ((self?.loginVM.islooged) != nil){
                        self?.navigationController?.popViewController(animated: true)
                    }
                }))
                self?.present(alert, animated: true)
            }
        }
        loginVM.getUser(email: emailTextField.text!, password: passwordTextField.text!)
        
        
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        let registerVC =  RegisterViewController.instantiateVC()
        registerVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(registerVC, animated: true)
        
    }
    
    
}
