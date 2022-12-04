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
    
        
        loginVM.bindResultToLoginView = { [weak self] in
            guard let self =  self else {return}
            
            DispatchQueue.main.async { [weak self] in
                
                let alert = Alerts.instance.showAlert(title: "success", message: loginVM.message ?? "")
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
        
        guard let vc  = storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
        
    }
    
    @IBAction func backTOMeButton(_ sender: UIButton) {
        
        self.dismiss(animated: true)
    }
    
}
