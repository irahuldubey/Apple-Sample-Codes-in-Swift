//
//  RestServiceAPI.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

// RestServiceAPI Protcol has all the service method and exposes the same through RestServiceAPI
protocol FlickrServiceAPI {
  
  /// Fetch the Photo Details from Flickr API
  ///
  /// - Parameters:
  ///   - query: as of type String, user queries for the given String
  ///   - itemCount: item count requested
  ///   - completion: as of type Array of Flickr Object
  ///   - error: Error if Any
  /// - Returns: NA
  /// - Throws: Throws of type Void
  func fetchFlick(with query: String, and itemCount: Int, withCompletionHandler completion: @escaping (FlickrServiceResponse) -> ()) throws -> Void
  
  
  /// Fetch the Image with the Given URL
  ///
  /// - Parameters:
  ///   - withURL: URL for the Image
  ///   - completionHandler: of type Success (Data) and Failure (error)
  /// - Returns: None
  /// - Throws: None
  func fetchImage(with photo: Photo, size: FlickrPhotoSize,completionHandler completion: @escaping (FlickrImageResponse) -> ()) throws -> Void
}
