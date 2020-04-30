//
//  RestServiceAPI.swift
//  RESTAPI
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//


// RestServiceAPI Protcol has all the service method and exposes the same through RestServiceAPI

protocol RestServiceAPI {
  
  //Fetch the user details for the given id
  func fetchUserDetails(for id: Int, withCompletionHandler completion: @escaping (User?) -> (),  errorHandler error: @escaping (Error?) -> ()) throws -> Void
  
}
