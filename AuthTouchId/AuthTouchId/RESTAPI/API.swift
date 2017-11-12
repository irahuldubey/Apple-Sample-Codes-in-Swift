//
//  API.swift
//  RESTAPI
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

//Declare as constant, need to replace with the id for which the servcie is requested
let kCustomerName = "{username}"
let kCustomerPassword = "{password}"

enum API: String {
  
  case userDetails  = "http://HOST/username={username},password={password}"
  case custDetails  = "http://HOST1/username={username},password={password}"

}
