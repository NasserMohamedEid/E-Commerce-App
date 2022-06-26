//
//  DescriptionViewController.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 24/06/2022.
//

import UIKit
import SDWebImage

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var DescriptionCollectionView: UICollectionView!
    
    @IBOutlet weak var ImagesPageController: UIPageControl!
  
    @IBOutlet weak var Sec2Label: UILabel!
    @IBOutlet weak var ReviewsLabel: UILabel!
    
    @IBOutlet weak var PriceLabel: UILabel!
    
    @IBOutlet weak var RatingLabel: UILabel!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    @IBOutlet weak var descriptionDetailsLabel: UILabel!
    var descriptionViewModel : DescriptionViewModel!
    
//    struct Review {
//        var rate : Float
//        var price : Float
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DescriptionCollectionView.delegate = self
        DescriptionCollectionView.dataSource = self
        descriptionViewModel = DescriptionViewModel()
        descriptionViewModel.bindResultToDescriptionView={[weak self]in
                                DispatchQueue.main.async {
                                    self?.DescriptionCollectionView.reloadData()
                                   // self?.viewDidLoad()
                                    self?.descriptionDetailsLabel.text = self?.descriptionViewModel.result?.body_html
                                    self?.RatingLabel.text = "4/5"
                                    self?.ReviewsLabel.text = self?.descriptionViewModel.result?.title
                                var price = self?.descriptionViewModel.result?.variants[0].price
                                    
                                    self?.PriceLabel.text = (price ?? "") + "LE"
                                    

                                }
                            }
        
        descriptionViewModel.getItems(id:7358110630059)
        //descriptionDetailsLabel.text = descriptionViewModel.result?.title
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DescriptionViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return descriptionViewModel.result?.images.count ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = DescriptionCollectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCollectionViewCell", for: indexPath) as? DescriptionCollectionViewCell else {return UICollectionViewCell()}
        let urlimage = URL(string: descriptionViewModel.result?.images[indexPath.row].src ?? "")
        cell.DescriptionImageView.sd_setImage(with:urlimage, placeholderImage: UIImage(named: "product"))
       // print(descriptionViewModel.result?.title)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexpath: IndexPath) -> CGSize{
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/1.5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
