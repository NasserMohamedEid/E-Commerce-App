//
//  ViewController.swift
//  E-Commerce App
//
//  Created by Nasser Mohamed on 30/06/2022.
//

import UIKit

class CartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell",for: indexPath) as? CartTableViewCell else{return UITableViewCell()}
        cell.priceLable.text="asdasdasdasdasdasdasdas"
        cell.productImage.image=UIImage(named: "t-shirt")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    

    @IBOutlet weak var cartViewController: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    

}
