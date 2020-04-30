//
//  ParentCollectionViewCell.swift
//  GridCollectionView
//
//  Created by Rahul Dubey on 2/14/17.
//

import UIKit

class ParentCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var childCollectionView: UICollectionView!


  override func awakeFromNib() {
    
  }
  
}


extension ParentCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildCell", for: indexPath) as! ChildCollectionViewCell
    cell.backgroundColor = .blue
    return cell
    
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 16
  }
  
}
