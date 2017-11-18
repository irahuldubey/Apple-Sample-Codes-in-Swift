//
//  APIParams.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/17/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

///MARK: - API's parameters
enum APIParams {
  
  //MARK: - Flickr Search API Keys
  enum Flickr: String {
    case apiKey = "{apiKey}"
    case itemCount = "{itemCount}"
    case queryString = "{queryString}"
  }
  
  ///MARK: - Flickr Photo API Keys
  enum FlickrPhoto: String {
    case farmId = "{farm-id}"
    case serverId = "{server-id}"
    case id = "{id}"
    case imageSize = "{imageSize}"
    case secretId = "{o-secret}"
  }
}
