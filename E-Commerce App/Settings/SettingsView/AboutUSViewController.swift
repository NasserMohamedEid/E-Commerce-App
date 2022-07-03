//
//  AboutUSViewController.swift
//  E-Commerce App
//
//  Created by sherif on 03/07/2022.
//

import UIKit

class AboutUSViewController: UIViewController {

    @IBOutlet weak var aboutUSTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        aboutUSTextView.text = "Our Team : \n AhmedHamam\n Nasser Mohamed \n SherifSamy "
        aboutUSTextView.textAlignment = .center
    }
    


}
