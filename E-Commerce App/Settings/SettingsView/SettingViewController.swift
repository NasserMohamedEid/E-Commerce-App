//
//  SettingViewController.swift
//  E-Commerce App
//
//  Created by sherif on 27/06/2022.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var settingsTableView: UITableView!
    @IBOutlet weak var logOutButton: UIButton!{
        didSet{
            logOutButton.layer.cornerRadius = logOutButton.frame.height / 2
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Settings"
    }
    


}
extension SettingViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? settingsTableViewCell else {return
            UITableViewCell()
        }
        cell.textLabel?.text = "Address"
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let addressVC = storyboard?.instantiateViewController(withIdentifier: "AdderessViewController") as? AdderessViewController else {return}
        
        self.navigationController?.pushViewController(addressVC, animated: true)
        
    }
    
    
    
}
