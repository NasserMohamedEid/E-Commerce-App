//
//  BrandsCollectionViewCell.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import UIKit

class BrandsCollectionViewCell: UICollectionViewCell {
    
    //MARK:-Outlets
    
    @IBOutlet weak var cellContentView: UIView!{
        
        didSet{
            cellContentView.layer.borderWidth = 2
            cellContentView.backgroundColor = .white
            cellContentView.layer.borderColor = UIColor.black.cgColor
            cellContentView.layer.cornerRadius = cellContentView.frame.size.width / 4
        }
    }
    @IBOutlet weak var brandImageView: UIImageView!{
        didSet{
            brandImageView.layer.cornerRadius = brandImageView.frame.size.width / 4
        }
    }
    @IBOutlet weak var brandLBL: UILabel!
    
}
