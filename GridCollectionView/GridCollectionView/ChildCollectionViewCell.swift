//
//  ChildCollectionViewCell.swift
//  GridCollectionView
//
//  Created by Rahul Dubey on 2/14/17.
//

import UIKit

class ChildCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var imageView: UIImageView!

  
  override func awakeFromNib() {
   
    imageView.clipsToBounds = false
  }
  
  override var canBecomeFocused: Bool{
    return false
  }
  
  
}


class CustomImageView: UIImageView {
  
  override var canBecomeFocused: Bool {
    return true
  }
  
  override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
    
    
  }
  
  
}


