//
//  MeViewController.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import UIKit

class MeViewController: UIViewController {

    @IBOutlet weak var meTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
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
    
    
    
    
    
    
    
}
