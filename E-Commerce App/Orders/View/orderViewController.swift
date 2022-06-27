//
//  orderViewController.swift
//  E-Commerce App
//
//  Created by sherif on 27/06/2022.
//

import UIKit

class orderViewController: UIViewController {

    @IBOutlet weak var orderTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "order List"
    }
    

   
 

}
extension orderViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? orderListTableViewCell else{return
            UITableViewCell()
        }
        
        return cell 
    }
    
    
    
    
    
}
