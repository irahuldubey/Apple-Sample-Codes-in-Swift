//
//  RestServer.swift
//  RESTAPI
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit


//Class which makes the service call to the server
final class RestServerManager {

  //Create Singleton Instance.
  static let sharedInstance = RestServerManager()
  
  //Prevent the singleton from being initialized
  private init() { }

  //Completion Handlers to handler data types
  typealias CompletionHandlerDictionary = (JSONDictionary) -> ()
  typealias CompletionHandlerArray = (JSONArray) -> ()

  func makeHTTPGETRequest(withURLString urlString: String,
                          compeltionHandlerDictionary: CompletionHandlerDictionary? = nil,
                          completionHandlerArray: CompletionHandlerArray? = nil,
                          errorHandler: @escaping (Error) -> ()) {

    //Create a URL object from the URL String
    if let url = URL.init(string: urlString) {
      
      //Create an instance of URL Session with the default configuration
      let defaultSession = URLSession(configuration: .default)
      
      let urlRequest = getURLRequest(url: url)
 
      //Initialize a URLSessionDataTask with the query url and a completion handler to call when the data task completes.
      let dataTask = defaultSession.dataTask(with: urlRequest) { (data,response,error) in
        
        //Data received throw the data in completion handler
        if let data = data {
          if let jsonDictionary = RestAPIHelper.parseToDictionary(data){
            compeltionHandlerDictionary?(jsonDictionary)
          }
          else if let jsonArray = RestAPIHelper.parseToArray(data) {
            completionHandlerArray?(jsonArray)
          }
        }
        
        //Error received throw the error
        if let error = error {
          errorHandler(error)
        }
      }
      dataTask.resume()
    }
  }

  //Create a URL Request with the given URL
  private func getURLRequest(url: URL) -> URLRequest {
    var request = URLRequest.init(url: url)
    request.httpMethod = RequestType.GET.rawValue
    request.timeoutInterval = Double(HTTPHeaderField.timeOut.rawValue)!
    request.cachePolicy = URLRequest.CachePolicy.reloadIgnoringLocalCacheData
    request.addValue(HTTPHeaderField.applicationJSON.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
    return request
  }
}
