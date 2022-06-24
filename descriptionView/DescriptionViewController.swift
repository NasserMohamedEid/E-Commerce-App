//
//  DescriptionViewController.swift
//  E-Commerce App
//
//  Created by Ahmed Hamam on 24/06/2022.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var DescriptionCollectionView: UICollectionView!
    
    @IBOutlet weak var ImagesPageController: UIPageControl!
  
    @IBOutlet weak var Sec2Label: UILabel!
    @IBOutlet weak var ReviewsLabel: UILabel!
    
    @IBOutlet weak var PriceLabel: UILabel!
    
    @IBOutlet weak var RatingLabel: UILabel!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DescriptionCollectionView.delegate = self
        DescriptionCollectionView.dataSource = self
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

extension DescriptionViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
}
