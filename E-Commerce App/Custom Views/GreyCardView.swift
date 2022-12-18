//
//  GreyCardView.swift
//  E-Commerce App
//
//  Created by sherif on 27/11/2022.
//


import UIKit


class GreyCardView:UIView {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        viewSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewSetup()
    }
    
    func viewSetup(){
        
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.masksToBounds = true
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 5
        self.backgroundColor = .gray
        
    }
    
    
}
