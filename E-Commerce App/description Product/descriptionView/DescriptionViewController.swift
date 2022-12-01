//
//  DescriptionViewController.swift
//  E-Commerce App
//

//  Created by Ahmed Hamam on 02/07/2022.
// Modified By Sherif Samy



import UIKit
import SDWebImage

class DescriptionViewController: UIViewController {
    
     //MARK: - Outlets
    
    @IBOutlet weak var DescriptionCollectionView: UICollectionView!
    @IBOutlet weak var ImagePageController: UIPageControl!
    @IBOutlet weak var sectionView: UIView!
    @IBOutlet weak var ReviewsLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var RatingLabel: UILabel!
    @IBOutlet weak var descriptionDetailsLabel: UILabel!

     //MARK: - vars
    
    var descriptionViewModel = DescriptionViewModel()
    var idProduct : Int?
    var timer : Timer?
    var currentIndex = 0
    
    
     //MARK: - life cycle
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Product Info"
        
        ImagePageController.numberOfPages = descriptionViewModel.result?.images.count ?? 0
        descriptionViewModel.bindResultToDescriptionView={[weak self]in
    
            DispatchQueue.main.async {
                
        self?.DescriptionCollectionView.reloadData()
        self?.descriptionDetailsLabel.text = self?.descriptionViewModel.result?.body_html
        self?.RatingLabel.text = "4/5"
        self?.ReviewsLabel.text = self?.descriptionViewModel.result?.title
        let price = self?.descriptionViewModel.result?.variants[0].price
        self?.PriceLabel.text = (price ?? "") + "LE"
       
            }
            
            self?.startTimer()
        }
        descriptionViewModel.getItems(id:idProduct ?? 0)
    }
    
     //MARK: - IB actions
    @IBAction func addToCartButton(_ sender: UIButton) {
        descriptionViewModel.addToCartPost()
    }
    
    @IBAction func addToFavButton(_ sender: UIButton) {
    }
    

}

 //MARK: - Extension for collection View Description

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
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

 //MARK: - Extension for Timer eith slider

extension DescriptionViewController {
    
    func startTimer(){
        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.timeAction), userInfo: nil, repeats: true)
    }
    
    
    @objc func timeAction(){
        
         guard let images  =  descriptionViewModel.result?.images else {return}
        let newScrollPosition = (currentIndex < images.count  - 1 ) ? currentIndex + 1  : 0
        DescriptionCollectionView.scrollToItem(at: IndexPath(item: newScrollPosition, section: 0), at: .centeredHorizontally, animated: true)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        currentIndex = Int(scrollView.contentOffset.x / DescriptionCollectionView.frame.width)
        ImagePageController.currentPage = currentIndex
        timer?.invalidate()
          startTimer()
    }
    
    
}
