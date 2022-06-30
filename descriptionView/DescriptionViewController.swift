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
    var timer : Timer?
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DescriptionCollectionView.delegate = self
        DescriptionCollectionView.dataSource = self
        descriptionViewModel = DescriptionViewModel()
        descriptionViewModel.bindResultToDescriptionView={[weak self]in
            DispatchQueue.main.async { [self] in
                                    self?.DescriptionCollectionView.reloadData()
                                   // self?.viewDidLoad()
                                    self?.descriptionDetailsLabel.text = self?.descriptionViewModel.result?.body_html
                                    self?.RatingLabel.text = "4/5"
                                    self?.ReviewsLabel.text = self?.descriptionViewModel.result?.title
                                var price = self?.descriptionViewModel.result?.variants[0].price
                                    
                                    self?.PriceLabel.text = (price ?? "") + "LE"
                                    
                                }

                            }
       // self.startTimer()
//        ImagesPageController.numberOfPages = descriptionViewModel.result?.images.count ?? 0
        //print(descriptionViewModel.result?.images[3].src.count)
       // ImagesPageController.currentPage = 0
        descriptionViewModel.getItems(id:7358110630059)
        //descriptionDetailsLabel.text = descriptionViewModel.result?.title
        
    }

    @IBAction func addToCartButton(_ sender: UIButton) {
        
    }
    
    @IBAction func addToFavButton(_ sender: UIButton) {
    }
    

}

extension DescriptionViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(descriptionViewModel.result?.images.count ?? 0)
        return descriptionViewModel.result?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = DescriptionCollectionView.dequeueReusableCell(withReuseIdentifier: "DescriptionCollectionViewCell", for: indexPath) as? DescriptionCollectionViewCell else {return UICollectionViewCell()}
        let urlimage = URL(string: descriptionViewModel.result?.images[indexPath.row].src ?? "")
        cell.DescriptionImageView.sd_setImage(with:urlimage, placeholderImage: UIImage(named: "product"))
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexpath: IndexPath) -> CGSize{
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width/1.5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
//    func startTimer(){
//        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(moveToNext), userInfo: nil, repeats: true)
//    }
//    @objc func moveToNext(){
//        if currentIndex < (descriptionViewModel.result?.images.count ?? 3)-1 {
//            currentIndex += 1
//            print((descriptionViewModel.result?.images.count ?? 1)-1)
//        }else{
//            currentIndex = 0
//        }
//    ImagesPageController.currentPage = currentIndex
//        DescriptionCollectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
//    }
}
