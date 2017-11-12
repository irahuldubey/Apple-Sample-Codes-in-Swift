//
//  RestService.swift
//  RESTAPI
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

open class RestService: RestServiceAPI {
  
  public init() { }

  public func updateUserDetails(for customer: Customer, withCompletionHandler completion: @escaping (Bool) -> ()) {
    
    //Get the URL for the User Details API
    let urlString = API.userDetails.rawValue
    //Replace the string with the actual requested Id
    var serviceURLString = RestAPIHelper.replaceNameString(string: urlString, with: customer.username)
    serviceURLString = RestAPIHelper.replacePasswordString(string: serviceURLString, with: customer.password)
    
    RestServerManager.sharedInstance.makeHTTPGETRequest(withURLString: serviceURLString, compeltionHandlerDictionary: { (jsonDictionary) in
      //Parse the given dictionary to the data model
      //let userInfo = RestAPIParser.parseUserResonse(dictionary: jsonDictionary)
      
      completion(true)
      
    }, completionHandlerArray: nil,
    errorHandler: { (error) in
      completion(false)
    })
  }
  
  func getCustomerInformation(for customer: Customer, withCompletionHandler completion: @escaping (CustomerDetails?) -> ()) {
    
    //Get the URL for the User Details API
    let urlString = API.userDetails.rawValue
    //Replace the string with the actual requested Id
    var serviceURLString = RestAPIHelper.replaceNameString(string: urlString, with: customer.username)
    serviceURLString = RestAPIHelper.replacePasswordString(string: serviceURLString, with: customer.password)

    RestServerManager.sharedInstance.makeHTTPGETRequest(withURLString: serviceURLString, compeltionHandlerDictionary: { (jsonDictionary) in
      //Parse the given dictionary to the data model
      if let customerDetails = RestAPIParser.parseCustomerResonse(dictionary: jsonDictionary) {
        completion(customerDetails)
      }
      else{
        completion(RestAPIParser.getCustomerDetailsFromLocal())
      }
    }, completionHandlerArray: nil,
       errorHandler: { (error) in
        completion(RestAPIParser.getCustomerDetailsFromLocal())
    })
  }
}
