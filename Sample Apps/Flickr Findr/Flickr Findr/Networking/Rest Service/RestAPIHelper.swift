//
//  RestAPIHelper.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

///MARK: - RequestType
///HTTP Request Type
enum RequestType: String {
  case GET
  case POST
}

///MARK: - HTTPHeaderField
///HTTP Header Fields
enum HTTPHeaderField: String {
  case contentType = "Content-Type"
  case applicationJSON = "application/json"
  case timeOut = "10"
}

/// Rest API Helper for parsing
struct RestAPIHelper {
 
  /// Get the Flick API URL
  ///
  /// - Parameters:
  ///   - query: as of type String, Query sent by the UI
  ///   - itemCount: as of type Int
  /// - Returns: as of type string, returned as URLString
  static func getFlickrAPI(with query: String, and itemCount: Int) -> String {
    let queryStringURLString = API.flickr.replacingOccurrences(of: APIParams.Flickr.queryString.rawValue, with: "\(query)")
    let itemCountURLString = queryStringURLString.replacingOccurrences(of: APIParams.Flickr.itemCount.rawValue, with: "\(itemCount)")
    let apiKeyURLString = itemCountURLString.replacingOccurrences(of: APIParams.Flickr.apiKey.rawValue, with: APIKeys.flickr)
    return apiKeyURLString
  }
  
  
  /// Get the Flickr Photo API
  ///
  /// - Parameters:
  ///   - photo: is of type photo Object with details
  ///   - imageSize: size of the image requested
  /// - Returns: URL String
  static func getFlickrPhotoAPI(withFarmId farmId: String,
                                serverId: String,
                                id: String,
                                secretId: String,
                                imageSize: FlickrPhotoSize) -> String {
    
      let queryFlickrPhotoString = API.flickrPhoto.replacingOccurrences(of: APIParams.FlickrPhoto.farmId.rawValue, with: farmId)
      let serverIdURLString = queryFlickrPhotoString.replacingOccurrences(of: APIParams.FlickrPhoto.serverId.rawValue, with: serverId)
      let idURLString = serverIdURLString.replacingOccurrences(of: APIParams.FlickrPhoto.id.rawValue, with: id)
      let secretIdURLString = idURLString.replacingOccurrences(of: APIParams.FlickrPhoto.secretId.rawValue, with: secretId)
      let imageURLString = secretIdURLString.replacingOccurrences(of: APIParams.FlickrPhoto.imageSize.rawValue, with: imageSize.rawValue)
      return imageURLString
  }
}
