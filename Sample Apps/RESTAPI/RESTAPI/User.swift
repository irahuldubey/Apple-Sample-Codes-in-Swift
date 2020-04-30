//
//  User.swift
//  RESTAPI
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

public struct User {
  
  var name: String?
  var userName: String?
  var email: String?
  var phone: String?
  var website: String?
  
  init(name: String?, userName: String? = nil, email: String? = nil, phone: String? = nil, website: String? = nil) {
    self.name = name
    self.userName = userName
    self.email = email
    self.phone = phone
    self.website = website
  }

}
