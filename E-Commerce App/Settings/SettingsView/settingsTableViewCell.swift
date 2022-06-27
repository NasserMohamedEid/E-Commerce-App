//
//  settingsTableViewCell.swift
//  E-Commerce App
//
//  Created by sherif on 27/06/2022.
//

import UIKit

class settingsTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsContentView: UIView!{
        
        didSet{
            
            settingsContentView.layer.borderColor = UIColor.gray.cgColor
            
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
