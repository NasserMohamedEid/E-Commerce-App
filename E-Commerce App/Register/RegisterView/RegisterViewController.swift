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
    @IBOutlet weak var Phone: UITextField!
    
    var registerVM =  RegisterViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func makeRegisterButton(_ sender: UIButton) {
        
        registerVM.bindResultToRegisterView = { [weak self] in
            
            DispatchQueue.main.async {

            let alert =  UIAlertController(title: "Success", message: "User ceated successfully", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self?.present(alert, animated: true)
                }
            }
        
        registerVM.createCustomer(name: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailInTextField.text ?? "", password: passwordInTextField.text ?? "", phone: Phone.text ?? "")
        
        
        guard let loginVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController")as? LoginViewController  else {return}
        loginVc.modalPresentationStyle = .fullScreen
        self.present(loginVc, animated: true)
    }

    
    @IBAction func backMeScreenButton(_ sender: UIButton) {
        
       // self.dismiss(animated: true)
    }
    
    
    
    
    
    
}
