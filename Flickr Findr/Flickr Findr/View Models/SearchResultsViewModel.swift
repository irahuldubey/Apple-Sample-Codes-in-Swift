//
//  SearchResultsViewModel.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

///Class Description: View Model Class for SearchResultsViewController has both the business and presentation logic

public final class SearchResultsViewModel {
  
  /// SearchResultResponse : CompletionHandler (messageLabel text)
  typealias SearchResultsResponse = (_ labelText: String?, _ photos: [Photo]?) -> ()

  //MARK: Properties
  
  ///Initial search result count
  private let kSearchResultCount: Int = 25
  
  /// Get an instance of the flickr service
  private var flickrServiceAPI: FlickrServiceAPI = FlickrService()
  
  //MARK: - Initializer

  init() {}
  
  /// Fetch the Flickr Photo and Title from Flickr API
  ///
  /// - Parameter query: as of Type String, Flickr search query
  func fetchFlickr(with query: String,
                   withCompletionHandler completion: @escaping SearchResultsResponse) {
    
    do {
      try flickrServiceAPI.fetchFlick(with: query,
                                         and: kSearchResultCount,
                                         withCompletionHandler: { (serviceResponse) in
        switch serviceResponse {
        case .success(let photo):
              print("Received success for query\(query)")
              completion(nil, photo?.photos)
        case .failure(let error, let flickerError):
          if let error = error {
              print("Received an error with message !\(error.localizedDescription)")
              completion(error.localizedDescription, nil)
          }
          if let flickrError = flickerError {
              print("Received an error with message !\(flickrError.displayMessage)")
              completion(flickrError.displayMessage, nil)
          }
        }
      })
    } catch let error {
        print("Unexpected Error thrown !\(error)")
    }
  }
  
  //MARK - Deinitializer
  
  deinit {
    print("Deinitialized Search Result View Model")
  }
}
