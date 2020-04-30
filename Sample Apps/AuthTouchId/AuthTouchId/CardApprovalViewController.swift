//
//  CardApprovalViewController.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/23/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class CardApprovalViewController: UIViewController, NVActivityIndicatorViewable {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var images: [UIImage] = [UIImage]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    images = [
      UIImage.init(named: "Card2")!,
      UIImage.init(named: "Card3")!,
      UIImage.init(named: "Card5")!
    ]
    
    let size = CGSize(width: 50, height: 50)
    startAnimating(size, message: "Approving Please wait !!", type: NVActivityIndicatorType(rawValue: 3)!)
    
    self.view.backgroundColor = .clear
    self.view.isOpaque = false
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
      self.autoScroll()
    }
  }
  
  private func autoScroll () {
    
    let colletionViewContentOffset = collectionView.contentOffset.y
    let nextOffset = colletionViewContentOffset + 1
    
    UIView.animate(withDuration: 0.001, delay: 0, options: .allowAnimatedContent, animations: { [weak self]() -> Void in
      self?.collectionView.contentOffset = CGPoint(x: 0, y: nextOffset)
    }) { [weak self](finished) -> Void in
      let maxOffsetY = (self?.collectionView.contentSize.height)! - (self?.collectionView.frame.size.height)!
      if nextOffset != maxOffsetY {
        self?.autoScroll()
      }
      else{
        NVActivityIndicatorPresenter.sharedInstance.setMessage("You are all set !")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
          if let homeViewController = self?.presentingViewController as? HomeViewController {
            homeViewController.view.alpha = 1.0
          }
          self?.stopAnimating()
          self?.dismiss(animated: true, completion: nil)
        }
      }
    }
  }
  
  override var preferredContentSize: CGSize {
    get {
      if let fullSize = self.presentingViewController?.view.bounds.size {
        return CGSize(width: fullSize.width * 0.5,
                      height: fullSize.height * 0.60)
      }
      return super.preferredContentSize
    }
    set {
      super.preferredContentSize = newValue
    }
  }
  
  @IBAction func dismiss(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
}


extension CardApprovalViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CustomCollectionViewCell
    cell.imageView.image = images[indexPath.row]
    return cell
  }
}
