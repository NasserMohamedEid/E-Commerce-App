//
//  MeViewController.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import UIKit

class MeViewController: UIViewController {

    //MARK:-outlets : -
    

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
            
            loginRegisterButton.shopifyBtn(title: "LOGIN/REGISTER")
        }
    }
    
    @IBOutlet weak var welcomeLBL: UILabel!
    //MARK:- lifecycle : -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkExistingUser()
        
        setupNavgitionControllerApperance()
       
    }
    
    //MARK:-Function Helper
    
    func checkExistingUser(){
        
        if let user = UserManager.loogedInUser {
            welcomeLBL.text = "Hi,\(user.firstName)"
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
        
        guard let settingsVC = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else {return}
        self.navigationController?.pushViewController(settingsVC, animated: true)
        
    }
    
    @IBAction func moreOrderButton(_ sender: UIButton) {
        
        guard let orderListVC = storyboard?.instantiateViewController(withIdentifier: "orderViewController") as? orderViewController else {return}
        
        self.navigationController?.pushViewController(orderListVC, animated: true)
        
    }
    
    
    @IBAction func LoginRegisterButtonPressed(_ sender: UIButton) {
        
        
        if loginRegisterButton.titleLabel?.text == "LOGIN/REGISTER" {
            
           guard let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController")else {return}
            
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
}
extension MeViewController :UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MeTableViewCell else{return
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
