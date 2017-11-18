//
//  ImageDownloadManager.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/17/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

//Class Desscription: Call the Image Service to download the Photo, later on this can be extended to cache the images as well.
//At this point we use the FlickService API protocol to call the webservice.

import Foundation
import UIKit

public final class ImageDownloadManager {

  //Create an instance of Flickr API
  private let flickrServiceAPI: FlickrServiceAPI = FlickrService()

  //Create a default Global Queue
  private let imageQueue = DispatchQueue.global()
  
  //Create a Singleton Class
  static let sharedInstance = ImageDownloadManager()
  
  /// Fetch the image from FlickrServiceAPI
  ///
  /// - Parameters:
  ///   - photo: Photo object with details
  ///   - size: size of the image requested
  ///   - completionHandler: returns Image if downloaded else nil
  public func fetchImage(with photo: Photo?, size: FlickrPhotoSize?, completionHandler: @escaping (UIImage?) -> ()){
    
    guard let photo = photo,
          let size = size
    else {
      //Add to Logger Info
      print("Invalid Request for the Image")
      return
    }

    // Dispatch our worker to the global queue asynchronously
    imageQueue.async {
        do {
        try self.flickrServiceAPI.fetchImage(with: photo, size: size) { (response) in
          switch response {
          case .success(let data):
            //Get the data, transform it to image and send it to the caller
            DispatchQueue.main.async {
              if let data = data {
                let imageWithData = UIImage.init(data: data)
                completionHandler(imageWithData)
              }
            }
          case .failure(let error):
            //Add to Logger Error
            print("Unable to download the file with error \(String(describing: error?.localizedDescription))")
            completionHandler(nil)
          }
        }
      } catch let error {
        //Add to Logger Error
        print("Download failed with error\(error.localizedDescription)")
        completionHandler(nil)
      }
    }
  }
}

