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

  public func fetchUserDetails(for id: Int, withCompletionHandler completion: @escaping (User?) -> (),
                                            errorHandler error: @escaping (Error?) -> ()) {
    
    //Get the URL for the User Details API
    let urlString = API.userDetails.rawValue
    //Replace the string with the actual requested Id
    let serviceURLString = RestAPIHelper.replaceString(string: urlString, with: id)
    
    RestServerManager.sharedInstance.makeHTTPGETRequest(withURLString: serviceURLString, compeltionHandlerDictionary: { (jsonDictionary) in
      //Parse the given dictionary to the data model
      let userInfo = RestAPIParser.parseUserResonse(dictionary: jsonDictionary) 
      completion(userInfo)
      
    }, completionHandlerArray: nil,
    errorHandler: { (error) in
      
    })
  }
}
