//
//  AddNewAddressViewController.swift
//  E-Commerce App
//
//  Created by sherif on 27/06/2022.
//

import UIKit

class AddNewAddressViewController: UIViewController {

    @IBOutlet weak var addAddressOutlet: UIButton!{
        didSet{
            addAddressOutlet.layer.cornerRadius = addAddressOutlet.layer.frame.height / 2
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    


}
