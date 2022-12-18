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
    
    //MARK: - Outlets:
    
    @IBOutlet weak var float: Floaty!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    //MARK: - Vars
    
    var categoryViewModel:CategoryViewModel!
    var CollectionCell:CategoryCollectionViewCell!
    var arrayOfProduct:[Products]?
    var SUBProduct:[Products]?
    
    
    //MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryViewModel = CategoryViewModel()
        setupNavgitionControllerApperance()
        didSelectSegment(segmentControl)
        addFloatingButton()
    }
    
    
    //MARK: - IBActions
   
   @IBAction func didSelectSegment(_ sender: UISegmentedControl){
       
       switch segmentControl.selectedSegmentIndex {
              case 0:getData(id: 286861426859)
              case 1:getData(id: 286861459627)
              case 2:getData(id: 286861394091)
              default:getData(id: 286861492395)
          }
   }

    
     //MARK: - Function Helper
    
    
    func addFloatingButton(){
        
        let accessoriesImage = UIImage(named: "accessories")
        let shoseImage = UIImage(named: "shose")
        let t_shirtImage = UIImage(named: "t-shirt")
        float.addItem("accessories", icon: accessoriesImage, handler: { [self]_ in
            arrayOfProduct?.removeAll()
            var y=0
            for _ in 0...(categoryViewModel.result?.count ?? 0)-1 {
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
            for _ in 0...(categoryViewModel.result?.count ?? 0)-1 {
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
            for _ in 0...(self.categoryViewModel.result?.count ?? 0)-1 {
                if self.categoryViewModel.result?[y].product_type=="T-SHIRTS"{
                    self.arrayOfProduct?.append(self.categoryViewModel.result![y])
                }
                y+=1
            }
            
            self.categoryCollectionView.reloadData()
        })
        self.view.addSubview(float)
        
    }
    
    
    
    func getData(id:Int){
        categoryViewModel.bindResultToHomeView = { [weak self]in
            DispatchQueue.main.async {
                self?.arrayOfProduct = self?.categoryViewModel.result
                self?.categoryCollectionView.reloadData()
            }
        }
        categoryViewModel.getItems(id:id)
    }
    
    
    func setupNavgitionControllerApperance(){
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor.systemYellow
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
}

//MARK: - Extension For collection View

extension CategoryViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return categoryViewModel.result?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
        
        let category = categoryViewModel.result?[indexPath.row]
        cell.nameLable.text = category?.title
        if let image  = category?.images?[0].src {
            cell.productImage.sd_setImage(with:URL(string: image) ,placeholderImage: UIImage(named: "placeholder-images"))
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let DVC = storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController")as? DescriptionViewController else { return }
        DVC.idProduct = categoryViewModel.result?[indexPath.row].id
        self.navigationController?.pushViewController(DVC, animated: true)
    }
    
    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
    
    
}
