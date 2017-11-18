//
//  Flickr+Enumerations.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/17/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

//MARK: - Flickr Photo Size
public enum FlickrPhotoSize: String {
  ///Medium 640, 640 on longest side
  case medium = "z"
  ///Thumbnail, 100 on longest side
  case thumbnail = "t"
  ///Original image, either a jpg, gif or png, depending on source format
  case original = "o"
}

//MARK: - Flickr Service Response
public enum FlickrServiceResponse {
  ///Success Response from the Flickr Search Service sending Photos Object
  case success(photos: Photos?)
  ///Failure Response from the Flickr Search Service sending Error
  case failure(error: Error?, serviceError: FlickrError?)
}

//MARK: - Flickr Image Service Response
public enum FlickrImageResponse {
  /// Suceess response fromt the Image Service
  case success(data: Data?)
  /// Failure Response from the Image Service
  case failure(error: Error?)
}

//MARK: - Flickr Data Error
public enum DataError: Error {
  /// This case is returned when we get an unexpected response from a service
  case invalidResponse
  /// This case is returned in all errors when accessing Flickr API.
  case invalidJSONData
  /// This case returns when we dont have complete information from the service.
  case incompleteData
  /// Unable to download the image data
  case downloadError
}

//MARK: - Flickr Image Download Error
public enum ImageDownloadError: Error {
  /// Image Download Failed
  case downloadFailed
  /// Image request url was Invalid
  case invalidRequest
  /// Image Flickr Service Failed
  case serviceFailure
}
