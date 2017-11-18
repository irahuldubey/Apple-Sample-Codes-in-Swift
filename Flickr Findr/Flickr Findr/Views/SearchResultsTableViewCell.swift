//
//  SearchResultsTableViewCell.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

///Class Description: Search Table View Cell to show search results

class SearchResultsTableViewCell: UITableViewCell {
  
  //MARK - IBOutlets
  
  @IBOutlet weak var flickrTitleLabel: UILabel!
  @IBOutlet weak var flickrImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  //MARK: - SetUp Cell

  /// Decorate the cell with values
  ///
  /// - Parameter flickrPhoto: FLickr Photo
  func setUp(flickrPhoto: Photo) {

    DispatchQueue.main.async {
      self.flickrTitleLabel.text = flickrPhoto.title
    }
    
    ///Download  the image with the given photo object
    ImageDownloadManager.sharedInstance.fetchImage(with: flickrPhoto, size: .thumbnail) { [weak self] (image) in
      guard let `self` = self else { return }
      DispatchQueue.main.async {
        self.flickrImageView.image = image
      }
    }
  }
  
  //MARK: - Deinitializer
  
  deinit {
    print("Deinitialized SearchResultsTableViewCell")
  }
}
