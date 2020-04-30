//
//  Flickr.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

public struct Photo {
  
  //MARK: - Properties
  
  let id: String
  let farm: Int
  let secret: String
  let server: String
  let title: String
  let owner: String
  let isPublic: Bool
  let isFamily: Bool
  let isFriend: Bool
  let urlString: String
  
  //MARK: - Initializer
  
  /// Initializer for the Photo Struct
  ///
  /// - Parameters:
  ///   - id: is of type String, Represents id of the Photo
  ///   - farm: is of type Int, Represents farm id of the Photo
  ///   - secret: is of type String, server id of the Photo
  ///   - server: is of type String, Represents server of the Photo
  ///   - title: is of type String, Represents title of the Photo
  ///   - owner: is of type String, Represents owner of the Photo
  ///   - isPublic: is of type Bool, Represents isPublic/isNotPublic of the Photo
  ///   - isFamily: is of type Bool, Represents isFamily/isNotFamily of the Photo
  ///   - isFriend: is of type Friend, Represents isFriend/isNotAFriend of the Photo
  ///   - urlString: is of type String, Represents string url of the Photo
  init(id: String, farm: Int, secret: String, server: String, title: String, owner: String, isPublic: Bool, isFamily: Bool, isFriend: Bool, urlString: String) {
    self.id = id
    self.farm = farm
    self.secret = secret
    self.server = server
    self.title = title
    self.owner = owner
    self.isPublic = isPublic
    self.isFamily = isFamily
    self.isFriend = isFriend
    self.urlString = urlString
  }
}

