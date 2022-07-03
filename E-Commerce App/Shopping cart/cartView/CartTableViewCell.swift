//
//  TableViewCell.swift
//  E-Commerce App
//
//  Created by Nasser Mohamed on 30/06/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {
  
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var nameLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
