//
//  DependancyProvider.swift
//  E-Commerce App
//
//  Created by sherif on 19/12/2022.
//

import Foundation
import UIKit


struct DependancyProvider {
    
    static var service:Networking {
        return NetworkManager()
    }
    
    static var viewModel:BrandsViewModel {
        return BrandsViewModel(networkManager: self.service)
    }
    
    static var viewController:UIViewController {
        
        guard  let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Mainview")as? BrandsViewController else {return
            UIViewController()
        }
            vc.viewModel = viewModel
            return vc
        
       
    }
}
