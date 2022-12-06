//
//  MeViewController.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import UIKit

class MeViewController: UIViewController {

    //MARK:-outlets : -
    

    @IBOutlet weak var moreWishListButton: UIButton!

    @IBOutlet weak var moreOrdersButton: UIButton!
    @IBOutlet weak var meTableView: UITableView!{
        
        didSet{
            if (UserManager.loogedInUser != nil) {
                meTableView.isHidden =  true
            }else{
                meTableView.isHidden = false
            }
        }
    }
    @IBOutlet weak var loginRegisterButton: UIButton! {
        
        didSet{
            
            loginRegisterButton.customButton(title: "LOGIN/REGISTER")
        }
    }
    
    @IBOutlet weak var welcomeLBL: UILabel!
    
    
     //MARK: - life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkExistingUser()
        setupNavgitionControllerApperance()
       
    }
    
     //MARK: - function Helper
    
    func checkExistingUser(){
        
        if let user = UserManager.loogedInUser {
            welcomeLBL.text = "Hi,\(user.firstName ?? "")"
        }else{
            welcomeLBL.isHidden = true
            meTableView.isHidden = true
        }
    }

    func setupNavgitionControllerApperance(){
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.systemYellow
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    @IBAction func settingButtonPressed(_ sender: UIBarButtonItem) {
        
        let settingsVC = SettingViewController.instantiateVC()
        self.navigationController?.pushViewController(settingsVC, animated: true)
        
    }
    
    @IBAction func moreOrderButton(_ sender: UIButton) {
        
        let orderListVC = orderViewController.instantiateVC()
        self.navigationController?.pushViewController(orderListVC, animated: true)
    }
    
    
    @IBAction func LoginRegisterButtonPressed(_ sender: UIButton) {
        
        if loginRegisterButton.titleLabel?.text == "LOGIN/REGISTER" {
          
            let loginVC = LoginViewController.instantiateVC()
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
        
        
    }
    
    
}

 //MARK: - Extension

extension MeViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MeTableViewCell else{ return
            UITableViewCell()
        }
        
        cell.priceLBL.text = "150"
        cell.createdAtLBL.text = "27/10/2021"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
}
