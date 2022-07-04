//
//  LoginViewController.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 29/06/2022.
//

import UIKit



class LoginViewController: UIViewController {
    var delegate : getUser?
    @IBOutlet weak var loginImageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var loginViewModel : LoginViewModel!
    var userId : Int?
    var userName : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel = LoginViewModel()
        loginViewModel.bindResultToLoginView={[weak self]in
            DispatchQueue.main.async { [self] in
                for index in 0...(self?.loginViewModel.result?.count ?? 0)-1{
                    if self?.loginViewModel.result?[index].email == self?.emailTextField.text &&   (self?.loginViewModel.result?[index].multipass_identifier) == ( self?.passwordTextField.text){
                        self?.userId = self?.loginViewModel.result?[index].id
                        self?.userName = self?.loginViewModel.result?[index].first_name
                        print(self?.loginViewModel.result?[index].first_name ?? "")
                        

                       
                        self?.delegate?.getName(name: self?.loginViewModel.result?[index].first_name ?? "")
                        self?.navigationController?.popViewController(animated: true)
                    }
                }
            }
            
            
            print(self?.loginViewModel.result?.count)

        }
        loginImageView.image = UIImage(named:"shop")


    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        loginViewModel.fetchCustomer()
     
        print("what")
                
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        guard let VC = self.storyboard?.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else { return  }

        self.navigationController?.pushViewController(VC, animated: true)
    }
    

    
}
