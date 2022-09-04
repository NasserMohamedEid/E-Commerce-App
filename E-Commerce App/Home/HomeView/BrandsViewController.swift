//
//  ViewController.swift
//  E-Commerce App
//
//  Created by Nasser Mohamed on 22/06/2022.
//

import UIKit
import SDWebImage
class BrandsViewController: UIViewController {

    
    //MARK:-Outlets
    
    @IBOutlet weak var collectionContentView: UIView!{
        
        didSet{
            collectionContentView.layer.borderWidth = 3
            collectionContentView.layer.borderColor = UIColor.gray.cgColor
            collectionContentView.layer.masksToBounds = true
            collectionContentView.clipsToBounds = true
            collectionContentView.layer.cornerRadius = collectionContentView.frame.size.width / 5
            collectionContentView.backgroundColor = .gray
        }
    }
    
    @IBOutlet weak var salesImageView: UIImageView!{
        didSet{
            salesImageView.layer.cornerRadius = salesImageView.frame.size.height / 5
            salesImageView.layer.borderColor = UIColor.gray.cgColor
            salesImageView.layer.borderWidth = 3
        }
    }
    @IBOutlet weak var brandsCollectionView: UICollectionView!{
        didSet{
            brandsCollectionView.backgroundColor = UIColor.gray
        }
    }
    
    
    //MARK:-Constants & vars
    
    var brandsViewModel:BrandsViewModel?
    
    //MARK:-app lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        MakeImageChanges()
        brandsViewModel = BrandsViewModel()
        brandsViewModel?.bindingBrandsResult = {[weak self ] in
            guard let self =  self  else{return}
            DispatchQueue.main.async {
                self.brandsCollectionView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        brandsViewModel?.getBrands()
    }

    //MARK:- Functions Helper

    @IBAction func favouriteButoonPressed(_ sender: UIBarButtonItem) {
        
        guard let favVC = storyboard?.instantiateViewController(withIdentifier: "FavouriotesViewController") as? FavouriotesViewController else{return}
        
        self.navigationController?.pushViewController(favVC, animated: true)
    }
    
    func MakeImageChanges(){
        let images = [UIImage(named: "SalesImageHomeScreen"), UIImage(named: "SaleImages1"), UIImage(named: "womenSaleImage")].compactMap{$0}
        salesImageView.animationImages = images
        salesImageView.animationDuration = 1.9
        salesImageView.startAnimating()
    }
    
}


//MARK:- Extension For collectionViewDelegate and datasource:- 

extension BrandsViewController: UICollectionViewDelegate ,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandsViewModel?.brandssData?.smartCollections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? BrandsCollectionViewCell else {return
           UICollectionViewCell()
        }
        cell.brandLBL.text = brandsViewModel?.brandssData?.smartCollections?[indexPath.row].title
        if let image = brandsViewModel?.brandssData?.smartCollections?[indexPath.row].image?.src {
            cell.brandImageView.sd_setImage(with:URL(string: image) ,placeholderImage: UIImage(named: "placeholder-images"))
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard  let productVC = storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as? ProductsViewController else {return}
        productVC.title = "Brand Products"
        
        productVC.BrandID = brandsViewModel?.brandssData?.smartCollections?[indexPath.row].id ?? 0
        self.navigationController?.pushViewController(productVC, animated: true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                let padding: CGFloat =  60
                let collectionViewSize = collectionView.frame.size.height - padding
                return CGSize(width: 180, height: collectionViewSize / 2)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
