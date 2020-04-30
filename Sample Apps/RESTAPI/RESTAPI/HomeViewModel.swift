//
//  HomeViewModel.swift
//  RESTAPI
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class HomeViewModel {
  
  private var restServiceAPI: RestServiceAPI?
  private var id: Int = 0
  
  public var name: String?
  
  //Create an initializer to make a service call from the viewModel when it is initialized
  init(withId id: Int) {
    self.id = id
    restServiceAPI = RestService()
    fetchUserDetails()
  }
  
  private func fetchUserDetails() {
    do {
      try restServiceAPI?.fetchUserDetails(for: id, withCompletionHandler: { [weak self] (user) in
        if let user = user, let username = user.name {
            self?.name = username
            print("Name is", username)
        }
        }, errorHandler: {(error) in  })
    }
    catch let error {
      print("Received an error \(error)")
    }
  }
}
