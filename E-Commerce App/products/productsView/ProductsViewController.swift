//
//  ProductsViewController.swift
//  E-Commerce App
//
//  Created by sherif on 25/06/2022.
//

import UIKit
import SDWebImage
class ProductsViewController: UIViewController {

    var productViewModel:ProductViewModel?
    @IBOutlet weak var productsCollectionView: UICollectionView!
    
     var BrandID:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        productViewModel = ProductViewModel(services: NetworkManager())
        productViewModel?.bindingProductResult = { [weak self] in
            DispatchQueue.main.async {
                self?.productsCollectionView.reloadData()
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        productViewModel?.getProducts(brandId: BrandID ?? 0)
        
    }


}
extension ProductsViewController : UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productViewModel?.productsData?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? ProductsCollectionViewCell else {return
            UICollectionViewCell()
        }
        
        cell.product = productViewModel?.productsData?.products[indexPath.row]
        if let image = productViewModel?.productsData?.products[indexPath.row].images?[0].src  {
            cell.productImageView.sd_setImage(with:URL(string: image) ,placeholderImage: UIImage(named: "placeholder-images"))
        }
        
        cell.priceLBL.text = productViewModel?.productsData?.products[indexPath.row].variants?[0].price
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 5, left:5, bottom: 5, right: 5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let DVC = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController")as? DescriptionViewController else { return }
        DVC.idProduct = productViewModel?.productsData?.products[indexPath.row].id
        self.navigationController?.pushViewController(DVC, animated: true)
    }
    
    
    
}
