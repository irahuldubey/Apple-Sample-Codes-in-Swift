//
//  RestServer.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

//Class that makes service calls to the server
final class RestServerManager {

  //Create a URL Request with the given URL
  private func getURLRequest(with url: URL) -> URLRequest {
    var request = URLRequest.init(url: url)
    request.httpMethod = RequestType.GET.rawValue
    request.timeoutInterval = Double(HTTPHeaderField.timeOut.rawValue)!
    request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
    request.addValue(HTTPHeaderField.applicationJSON.rawValue,
                     forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
    return request
  }
  
  //Create Singleton Instance
  static let sharedInstance = RestServerManager()
  
  //Prevent the singleton from being initialized
  private init() { }

  //Completion Handlers to handler data types
  typealias CompletionHandlerDictionary = (JSONDictionary) -> ()

  
  /// HTTP GET Request to make a service call
  ///
  /// - Parameters:
  ///   - urlString: Url String for the service
  ///   - completionHandlerDictionary: is of type Dictionary or Array from Service
  ///   - errorHandler: Throw and Error
  
  func makeHTTPGETRequest(withURLString urlString: String,
                          completionHandlerDictionary: CompletionHandlerDictionary? = nil,
                          errorHandler: @escaping (Error) -> ()) {

    //Create a URL object from the URL String
    guard let url = URL.init(string: urlString) else {
      return
    }
      
      //Create an instance of URL Session with the default configuration
      let defaultSession = URLSession(configuration: .default)
    
      /// Create a URL Request with the given URL
      let urlRequest = getURLRequest(with: url)
 
      //Initialize a URLSessionDataTask with the query url and a completion handler to call when the data task completes.
      let dataTask = defaultSession.dataTask(with: urlRequest) { (data,response,error) in
        
        //Data received throw the data in completion handler
        if let data = data {
          //Check the type returned as JSONDictionary
          if let jsonDictionary = JSONUtilities.parseToDictionary(data){
            completionHandlerDictionary?(jsonDictionary)
          }
        }
        //Error received throw the error
        if let error = error {
          errorHandler(error)
        }
      }
      dataTask.resume()
  }
  
  /// HTTP Request for the Image
  ///
  /// - Parameters:
  ///   - urlString: URL String for the Image
  ///   - completion: is of type Data and Error on service completion
  func makeRequestForImage(with urlString: String?, competionHandler completion : @escaping (Data?, Error?) -> ()) {
    
      //Create a URL object from the URL String
      guard let urlString = urlString,
        let url = URL.init(string: urlString)
        else {
            return
        }
    
      //Create an instance of URL Session with the default configuration
      let defaultSession = URLSession(configuration: .default)
      
      /// Create an instance of URL Rrquest from the URL
      let urlRequest = URLRequest.init(url: url)
      
      //Initialize a URLSessionDataTask with the query url and a completion handler to call when the data task completes.
      let dataTask = defaultSession.dataTask(with: urlRequest) { (data,response,error) in
        
        //Data received throw the data in completion handler
        if let data = data {
          completion(data, nil)
        }
        //Error received throw the error
        if let error = error {
          completion(nil, error)
        }
      }
      dataTask.resume()
  }
}
