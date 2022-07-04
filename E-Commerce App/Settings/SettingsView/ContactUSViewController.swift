//
//  ContactUSViewController.swift
//  E-Commerce App
//
//  Created by sherif on 03/07/2022.
//

import UIKit

class ContactUSViewController: UIViewController {

    @IBOutlet weak var ConatctUStTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConatctUStTextView.text = "Ecommerce app@gmail.com "
        ConatctUStTextView.textAlignment = .center
    }


}
