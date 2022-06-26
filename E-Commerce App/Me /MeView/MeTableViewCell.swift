//
//  MeTableViewCell.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import UIKit

class MeTableViewCell: UITableViewCell {


    @IBOutlet weak var createdAtLBL: UILabel!
    @IBOutlet weak var priceLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
