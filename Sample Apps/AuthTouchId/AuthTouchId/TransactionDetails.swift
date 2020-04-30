//
//  TransactionDetails.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/23/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

struct TransactionDetails {
  
  var firstString: String
  var secondSring: String
  var amount: String

  init(withFirstString first: String, secondString second: String, andAmount amount: String) {
    
    self.firstString = first
    self.secondSring = second
    self.amount = amount
  }
}



