
//
//  ResponseKeys.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

enum APIResponseKeys {
  
  //MARK: - Flickr API Response Keys
  
  enum flickr: String {
    
    //Success Scenarios
    case photo
    case photos
    case page
    case pages
    case perpage
    case total
    case id
    case owner
    case secret
    case server
    case farm
    case title
    case isPublic
    case isFamily
    case isFriend
    
    //Error Scenrios
    case code
    case message
    
    //Status Flag
    case stat
  }
}
