//
//  Photos.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

public struct Photos {
  
  //MARK - Properties
  
  let page: Int
  let pages: Int
  let perPage: Int
  let total: String
  var photos: [Photo]?
  
  //MARK - Initializer
  
  /// Initializer for the Photos
  ///
  /// - Parameters:
  ///   - page: is of type Int, represents Page of Photos
  ///   - pages: is of type pages, represent Pages of Photos
  ///   - perPage: is of type Int, represent Per Page Photos
  ///   - total: is of type String, represent total Photos
  ///   - photos: is of type Array, reprsent array of Photo
  init(page: Int, pages: Int, perPage: Int, total: String, photos: [Photo]?) {
    self.page = page
    self.pages = pages
    self.perPage = perPage
    self.total = total
    self.photos = photos
  }
}
