//
//  CategoryViewController.swift
//  E-Commerce App
//
//  Created by Nasser Mohamed on 23/06/2022.
//

import UIKit
import SDWebImage
import Floaty
class CategoryViewController: UIViewController{
 
 
 
    @IBAction func favoritButton(_ sender: UIBarButtonItem) {
        guard let favVC = storyboard?.instantiateViewController(withIdentifier: "FavouriotesViewController") as? FavouriotesViewController else{return}
        
        self.navigationController?.pushViewController(favVC, animated: true)
    }
    
    
    @IBOutlet weak var float: Floaty!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var categoryViewModel:CategoryViewModel!
    var CollectionCell:CategoryCollectionViewCell!
    var arrayOfProduct:[Products]?
    var SUBProduct:[Products]?
  
    override func viewDidLoad() {
        super.viewDidLoad()
     
        categoryViewModel=CategoryViewModel()
            didSelectSegment(segmentControl)
        
       
        /***************float button******************/
        let accessoriesImage=UIImage(named: "accessories")
        let shoseImage=UIImage(named: "shose")
        let t_shirtImage=UIImage(named: "t-shirt")
        float.addItem("accessories", icon: accessoriesImage, handler: { [self]_ in
            arrayOfProduct?.removeAll()
            var y=0
            for index in 0...(categoryViewModel.result?.count ?? 0)-1 {
                if self.categoryViewModel.result?[y].product_type=="ACCESSORIES"{
                    self.arrayOfProduct?.append(categoryViewModel.result![y])
                  
                }
             y+=1
            }
            
            self.categoryCollectionView.reloadData()
        })
     
        float.addItem("shose", icon: shoseImage, handler: { [self]_ in
            arrayOfProduct?.removeAll()
           
            var y=0
            for index in 0...(categoryViewModel.result?.count ?? 0)-1 {
                if self.categoryViewModel.result?[y].product_type=="SHOES"{
                    self.arrayOfProduct?.append(categoryViewModel.result![y])
                  
                }
             y+=1
            }
            
            self.categoryCollectionView.reloadData()
            
        })
        float.addItem("t-shirt", icon: t_shirtImage, handler: {_ in
            self.arrayOfProduct?.removeAll()
            var y=0
            for index in 0...(self.categoryViewModel.result?.count ?? 0)-1 {
                if self.categoryViewModel.result?[y].product_type=="T-SHIRTS"{
                    self.arrayOfProduct?.append(self.categoryViewModel.result![y])
                  
                }
             y+=1
            }
            
            self.categoryCollectionView.reloadData()
        })
        self.view.addSubview(float)
    }
    
  /**************************** Select Segment *******************************/
    @IBAction func didSelectSegment(_ sender: UISegmentedControl) {
        switch segmentControl.selectedSegmentIndex{
        case 0:getData(id: 286861426859)
        case 1:getData(id: 286861459627)
        case 2:getData(id: 286861394091)
        default:getData(id: 286861492395)
        }
        
        
        
    }
    
    func getData(id:Int){
                        categoryViewModel.bindResultToHomeView={[weak self]in
                        DispatchQueue.main.async {
                            self?.arrayOfProduct=self?.categoryViewModel.result
                           
                            self?.categoryCollectionView.reloadData()
                        }
                    }
                            categoryViewModel.getItems(id:id)
        
    }
    /**************************************************************************/
 
}



extension CategoryViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    /******************************Setup collection**************************************/
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfProduct?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
        cell.nameLable.text=arrayOfProduct?[indexPath.row].title
        let url=URL(string: arrayOfProduct?[indexPath.row].images?[0].src ?? "")
        cell.productImage.sd_setImage(with: url)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let DVC = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController")as? DescriptionViewController else { return }
        DVC.idProduct = categoryViewModel.result?[indexPath.row].id
        self.navigationController?.pushViewController(DVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.categoryCollectionView.bounds.width/3, height:self.categoryCollectionView.bounds.width/3 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
   //minimum space between item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    /***************************************************************************************/
    
}
