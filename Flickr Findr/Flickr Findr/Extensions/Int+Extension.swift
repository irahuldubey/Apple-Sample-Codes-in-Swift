//
//  Bool+Extension.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

// MARK: - Extension of Int
extension Int {
  
  //Get the boolean value of an Integer
  func booleanValue () -> Bool {
    return self != 0
  }
}
