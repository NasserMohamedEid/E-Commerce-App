//
//  AdderessViewController.swift
//  E-Commerce App
//
//  Created by sherif on 27/06/2022.
//

import UIKit

class AdderessViewController: UIViewController {


    @IBOutlet weak var addressTableView: UITableView!
    @IBOutlet weak var addNewAddressButton: UIButton!{
        
        didSet{
            addNewAddressButton.layer.cornerRadius = addNewAddressButton.layer.frame.height / 2 
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func addNewAddressButoonPressed(_ sender: UIButton) {
        guard  let addAddressVc = storyboard?.instantiateViewController(withIdentifier: "AddNewAddressViewController") as? AddNewAddressViewController  else{return}
        
        self.navigationController?.pushViewController(addAddressVc, animated: true)
    }
    

}
extension AdderessViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? AddressTableViewCell else {return
            UITableViewCell()
        }
        
        
        return cell
    }
    
    
    
}
