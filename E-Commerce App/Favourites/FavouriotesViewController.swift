//
//  FavouriotesViewController.swift
//  E-Commerce App
//
//  Created by sherif on 03/07/2022.
//

import UIKit
import CoreData

class FavouriotesViewController: UIViewController {


    @IBOutlet weak var favCollectionView:
    UICollectionView!
    var arr : [NSManagedObject]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Favourites"
        arr = CoreDataManager.shared.getSavedProducts()
        DispatchQueue.main.async {
            self.favCollectionView.reloadData()
        }
        
    }
    
    
    
   
    



}
extension FavouriotesViewController :UICollectionViewDelegate ,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)as? FavouriteCollectionViewCell else {return
            UICollectionViewCell()
        }
        let url = URL(string: (arr?[indexPath.row].value(forKey: "productimage"))! as! String)
        cell.productImgView.sd_setImage(with: url)
        let name = arr?[indexPath.row].value(forKey: "productname") as! String
        cell.productTitle.text = name
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 5, left:5, bottom: 5, right: 5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    
    
    
}
