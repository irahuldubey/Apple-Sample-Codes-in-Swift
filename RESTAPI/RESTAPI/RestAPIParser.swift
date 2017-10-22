//
//  RestAPIParser.swift
//  RESTAPI
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit


/// Dictionary describing a JSON object
public typealias JSONDictionary = [String: AnyObject]
public typealias JSONArray = [AnyObject]

final class RestAPIParser: NSObject {

  static func parseUserResonse(dictionary: Dictionary<String, AnyObject>?) -> User? {
    
    guard let dictionaryObj = dictionary else { return nil }
    
    if let name = dictionaryObj["name"] as? String{
      let user = User.init(name: name)
      return user
    }
    return nil
  }
}
