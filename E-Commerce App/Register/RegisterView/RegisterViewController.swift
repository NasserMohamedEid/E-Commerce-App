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
    var customer:newCustomer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func makeRegisterButton(_ sender: UIButton) {
        
        registerVM.bindResultToRegisterView = { [weak self] in
            guard let self = self  else {return}
            DispatchQueue.main.async {

//            let alert =  UIAlertController(title: "Success", message: "User ceated successfully", preferredStyle: .alert)
//            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//                alert.addAction(okAction)
//                self?.present(alert, animated: true)
                
                if self.registerVM.errorData != nil  &&  self.registerVM.errorData?.errors.email?[0] == self.customer?.email {
                    
                    let alert = UIAlertController(title: "Error", message: self.registerVM.errorData?.errors.email?[0] ?? "", preferredStyle: .alert)
                    let alertPhone = UIAlertController(title: "Error", message: self.registerVM.errorData?.errors.phone?[0] ?? "", preferredStyle: .alert)
                    let okAction  = UIAlertAction(title: "OK", style: .default,handler: nil)
                    alert.addAction(okAction)
//                    self.present(alertPhone, animated: true)
                    self.present(alert, animated: true)
                }else{
                    let alert = UIAlertController(title: "Success", message: "User Created", preferredStyle: .alert)
                    let okAction  = UIAlertAction(title: "OK", style: .default,handler: nil)
                    alert.addAction(okAction)
                    self.present(alert, animated: true)
                }
                
                
                
                }
            }
        
        registerVM.createCustomer(name: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "", email: emailInTextField.text ?? "", password: passwordInTextField.text ?? "", phone: Phone.text ?? "")
        
    
    }

    
    @IBAction func backMeScreenButton(_ sender: UIButton) {
        
       // self.dismiss(animated: true)
    }
    
    
    
    
    
    
}
