//
//  RestServiceswift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

//Class Description: This classs implements FlickrServiceAPI

public class FlickrService: FlickrServiceAPI {
  
  ///MARK:- Initializer
  
  public init() { }
  
  ///MARK:- Search Photo Service
  
  /// Protocol Method: Accepts query and item count and gives the Photos
  ///
  /// - Parameters:
  ///   - query: as of type String, gives the current string searched
  ///   - itemCount: as of type Int, gives the no of items requested
  ///   - completion: completionHandler for the Photos Type
  ///   - error: Error received if Any.
  func fetchFlick(with query: String, and itemCount: Int, withCompletionHandler completion: @escaping (FlickrServiceResponse) -> ()) {

    //Replace the string with the actual requested Id
    let serviceURLString = RestAPIHelper.getFlickrAPI(with: query, and: itemCount)
    
    RestServerManager.sharedInstance.makeHTTPGETRequest(withURLString: serviceURLString, completionHandlerDictionary: { (jsonDictionary) in
      //Check for Status
      let serviceStatus = jsonDictionary[APIResponseKeys.flickr.stat.rawValue] as? String
      //If its a success
      if serviceStatus == APIResponseValues.flickr.ok.rawValue {
        //Parse the given dictionary to the data model
        let photoResponse = FlickrAPIParser.parseFlickrResonse(dictionary: jsonDictionary)
        completion(photoResponse)
      }
      else if serviceStatus == APIResponseValues.flickr.fail.rawValue {
        let errorResponse = FlickrAPIParser.parseErrorResponse(dictionary: jsonDictionary)
        completion(errorResponse)
      }
      else{
        completion(.failure(error: DataError.invalidJSONData, serviceError: nil))
      }
    }, errorHandler: { (error) in
        completion(.failure(error: error, serviceError: nil))
    })
  }
  
  ///MARK:- Fetch Image Service
  
  /// Fetch Image from the Flickr Service
  ///
  /// - Parameters:
  ///   - photo: is of type Photo
  ///   - size: is of type FlickrPhotoSize
  ///   - completion: Return Completion Handler with FlickrImageResponse
  func fetchImage(with photo: Photo, size: FlickrPhotoSize,completionHandler completion: @escaping (FlickrImageResponse) -> ()) {
    
      let imageURLString = RestAPIHelper.getFlickrPhotoAPI(withFarmId: String(photo.farm),
                                                           serverId: photo.server,
                                                           id: photo.id,
                                                           secretId: photo.secret,
                                                           imageSize: size)
    
    
    RestServerManager.sharedInstance.makeRequestForImage(with: imageURLString) { (data, error) in

      /// Check for the data and return success in the completion handler
      if let data = data {
        ///Add to Logger : Image Fetch Succeded
          completion(.success(data: data))
      }
      
      /// Check the error and return failure in the completion handler
      if error != nil {
          ///Add to Logger : Image Fetch Failed with Error
         completion(.failure(error: ImageDownloadError.downloadFailed))
      }
    }
  }
}
