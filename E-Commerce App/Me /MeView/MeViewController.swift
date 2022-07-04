//
//  MeViewController.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import UIKit

protocol getUser{
    func getName(name : String)
}

class MeViewController: UIViewController,getUser {
    func getName(name : String) {
        
        userNameLabel.text = name
    }
    
    //MARK:-outlets : -
    
    @IBOutlet weak var meTableView: UITableView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBAction func logButtonPressed(_ sender: UIButton) {
        guard let VC = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else { return  }
        VC.delegate = self
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    //MARK:- lifecycle : -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    //MARK:-Function Helper
  
    
    
    @IBAction func settingButtonPressed(_ sender: UIBarButtonItem) {
        
        guard let settingsVC = storyboard?.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else {return}
        self.navigationController?.pushViewController(settingsVC, animated: true)
        
    }
    
    @IBAction func moreOrderButton(_ sender: UIButton) {
        
        guard let orderListVC = storyboard?.instantiateViewController(withIdentifier: "orderViewController") as? orderViewController else {return}
        
        self.navigationController?.pushViewController(orderListVC, animated: true)
        
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
        cell.createdAtLBL.text = "27/10/ 2021"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    
}
