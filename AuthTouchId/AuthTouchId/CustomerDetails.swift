//
//  CustomerDetails.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/23/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

public struct CustomerDetails {
  
   var name: String
   var ssn: String
   var address: String
   var phoneNumber: String
   var email: String
  
  init(name: String, ssn: String, address: String, phoneNumber: String, email:String) {
      self.name = name
      self.ssn = ssn
      self.address = address
      self.phoneNumber = phoneNumber
      self.email = email
  }
}

