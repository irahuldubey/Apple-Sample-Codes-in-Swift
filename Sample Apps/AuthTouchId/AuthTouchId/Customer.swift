//
//  File.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

public struct Customer {
  var username: String
  var password: String
  
  init(withUsername username: String, andPassword password: String) {
    self.username = username
    self.password = password
  }
}

