//
//  ApprovedCreditCardsViewController.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/23/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class ApprovedCreditCardsViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var images: [UIImage] = [UIImage]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    images = [
      UIImage.init(named: "Card2")!,
      UIImage.init(named: "Card3")!,
      UIImage.init(named: "Card5")!
    ]    }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func dismissApprovedCardVC(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
}


extension ApprovedCreditCardsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApprovedCreditCardsViewControllerCellIdentifier", for: indexPath) as! CustomCollectionViewCell
    cell.imageView.image = images[indexPath.row]
    return cell
  }
}
