//
//  API.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

/// API's URL String
struct API {
  
  /// Flickr Search API
  static let flickr  = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(APIParams.Flickr.apiKey.rawValue)&tags=\(APIParams.Flickr.queryString.rawValue)&per_page=\(APIParams.Flickr.itemCount.rawValue)&format=json&nojsoncallback=1"
  
   //Flickr Photo API
   static let flickrPhoto  = "https://farm\(APIParams.FlickrPhoto.farmId.rawValue).staticflickr.com/\(APIParams.FlickrPhoto.serverId.rawValue)/\(APIParams.FlickrPhoto.id.rawValue)_\(APIParams.FlickrPhoto.secretId.rawValue)_\(APIParams.FlickrPhoto.imageSize.rawValue).jpg"
}
