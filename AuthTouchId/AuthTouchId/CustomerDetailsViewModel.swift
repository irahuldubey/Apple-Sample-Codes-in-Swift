//
//  CustomerDetailsViewModel.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/23/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

class CustomerDetailsViewModel {
  
  var customerDetails: CustomerDetails?
  var customerObj: Customer?
  
  private var restAPI: RestServiceAPI = RestService()

  init(withCustomer customer: Customer) {
    self.customerObj = customer
  }
  
  func getCustomerDetails(completionHandler: @escaping (CustomerDetails?) -> Void) {
    if let customerObj = customerObj {
      restAPI.getCustomerInformation(for: customerObj, withCompletionHandler: { (customerDetails) in
        completionHandler(customerDetails)
      })
    }
  }
}
