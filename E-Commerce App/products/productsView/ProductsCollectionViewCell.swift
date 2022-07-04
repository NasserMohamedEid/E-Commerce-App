//
//  ProductsCollectionViewCell.swift
//  E-Commerce App
//
//  Created by sherif on 29/06/2022.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    

    var product:products?
    @IBOutlet weak var cellContentView: UIView!{
        didSet{
            cellContentView.layer.borderWidth = 1
            cellContentView.layer.borderColor = UIColor.gray.cgColor
            cellContentView.layer.cornerRadius = cellContentView.frame.size.width / 4
        }
    }
    

    @IBOutlet weak var productImageView: UIImageView!
   
    @IBOutlet weak var priceLBL: UILabel!
    
    @IBAction func favoutiteButtonPressed(_ sender: UIButton) {
        
        CoreDataManager.shared.saveToFavourite(productList: product!)
        
    }
}
