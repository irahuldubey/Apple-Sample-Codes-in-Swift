//
//  LoginViewModel.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation


class LoginViewModel {
  
  private var customer: Customer
  
  private var restAPI: RestServiceAPI = RestService()
  
  public init(withUser user: Customer) {
    self.customer = user
    updateServerWithCustomerDetails()
  }
  
  public func updateServerWithCustomerDetails() {
    restAPI.updateUserDetails(for: customer) { (success) in
      if success {
          print("Customer details has been updated to the server")
      }
    }
  }
}
