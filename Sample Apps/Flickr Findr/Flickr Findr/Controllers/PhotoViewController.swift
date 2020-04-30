//
//  PhotoViewController.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, ActivityIndicatorProtocol {
  
  //MARK:- Properties
  
  var activityIndicator = UIActivityIndicatorView()

  //MARK:- IBOutlets
  
  @IBOutlet weak var imageView: UIImageView!
  
  //MARK:- Public Functions
  
  func setupdatePhoto(withPhotoObject photoObject: Photo) {
    showLoadingIndicator(withSize: CGSize.init(width: 80, height: 80))
    ImageDownloadManager.sharedInstance.fetchImage(with: photoObject, size: .medium) { [weak self] (image) in
      guard let `self` = self else { return }
      DispatchQueue.main.async {
        self.imageView.image = image
        self.removeLoadingIndicator()
      }
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK - Deinitializer
  
  deinit {
    print("Deinitialized PhotoViewController")
  }
  
}
