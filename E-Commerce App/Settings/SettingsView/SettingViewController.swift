//
//  SettingViewController.swift
//  E-Commerce App
//
//  Created by sherif on 27/06/2022.
//

import UIKit

class SettingViewController: UIViewController {

    //MARK:-Outlets:
    
    @IBOutlet weak var settingsTableView: UITableView!
    @IBOutlet weak var logOutButton: UIButton!{
        didSet{
            logOutButton.layer.cornerRadius = logOutButton.frame.height / 2
        }
    }
    
    //MARK:-lifecycles: -
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Settings"
    }
    
    
    //MARK:-Function Helper
    
    func setAlertForCurrencyChanges (){
        
        let alertcontroller = UIAlertController(title: " Currency", message: "Choose Currency", preferredStyle: .alert)
        let actionEGP  = UIAlertAction(title: "EGP", style: .default)
        let actionDollar = UIAlertAction(title: "USD", style: .default)
        alertcontroller.addAction(actionEGP)
        alertcontroller.addAction(actionDollar)
        self.present(alertcontroller, animated: true)
        
    }

    
   
    
}

//MARK:- Extensions

extension SettingViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? settingsTableViewCell else {return
            UITableViewCell()
        }
        
        let index = indexPath.row
        
        switch index {
        case 0 : cell.textLabel?.text = "Address"
            break
        case 1 :  cell.textLabel?.text = "Currency"
            break
        case 2 : cell.textLabel?.text = "Contact US"
            break
        case 3 :cell.textLabel?.text = "About US"
            break
        default:
            cell.textLabel?.text = "Address"
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            guard let addressVC = storyboard?.instantiateViewController(withIdentifier: "AdderessViewController") as? AdderessViewController else {return}
            self.navigationController?.pushViewController(addressVC, animated: true)
            
        }else if indexPath.row == 1 {
            setAlertForCurrencyChanges ()
        }
        else if indexPath.row == 2 {
            guard  let contactVC  = storyboard?.instantiateViewController(withIdentifier: "ContactUSViewController")as? ContactUSViewController else {return}
            
            contactVC.modalPresentationStyle = .formSheet
            self.present(contactVC, animated: true)
            
        }
        else{
            
            guard  let aboutVC  = storyboard?.instantiateViewController(withIdentifier: "AboutUSViewController")as? AboutUSViewController else {return}
            
            aboutVC.modalPresentationStyle = .formSheet
            self.present(aboutVC, animated: true)
            
        }
      
        
    }
    
    
    
}

