//
//  JSONUtilities.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

/// Dictionary describing a JSON object
public typealias JSONDictionary = [String: AnyObject]

final class JSONUtilities {
  
  // Convert data to data to Dictionary
  ///
  /// - Parameter data: as of type Data
  /// - Returns: as of type Dictionary
  static func parseToDictionary(_ data: Data) -> JSONDictionary? {
    guard let parsedJson = try? JSONSerialization.jsonObject(with: data, options:.allowFragments) as? JSONDictionary else {
      return nil
    }
    return parsedJson
  }
}

