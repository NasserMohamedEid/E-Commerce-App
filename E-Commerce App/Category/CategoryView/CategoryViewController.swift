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
 
    
    @IBOutlet weak var float: Floaty!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    var categoryViewModel:CategoryViewModel!
    var CollectionCell:CategoryCollectionViewCell!
    var arrayOfProduct:[Products]?
    var x=1
    override func viewDidLoad() {
        super.viewDidLoad()
        if x==1{
        categoryViewModel=CategoryViewModel()
            didSelectSegment(segmentControl)
            x=2
        }
        /***************float button******************/
        let accessoriesImage=UIImage(named: "accessories")
        let shoseImage=UIImage(named: "shose")
        let t_shirtImage=UIImage(named: "t-shirt")
        float.addItem("accessories", icon: accessoriesImage, handler: {_ in
            for index in 0...(self.categoryViewModel.result?.count ?? 0)-1{
                if self.categoryViewModel.result?[index].product_type=="ACCESSORIES"{
                    self.arrayOfProduct?[index]=(self.categoryViewModel.result?[index])!
                    print(self.arrayOfProduct?.count ?? 0)
                    print(self.arrayOfProduct?.count)
                }
                self.categoryCollectionView.reloadData()
                
            }
        })
        float.addItem("shose", icon: shoseImage, handler: {_ in
                print("hi")})
        float.addItem("t-shirt", icon: t_shirtImage, handler: {_ in
            print("hi")
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



extension CategoryViewController:UICollectionViewDataSource,UICollectionViewDelegate{
    
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
    /***************************************************************************************/
    
}
