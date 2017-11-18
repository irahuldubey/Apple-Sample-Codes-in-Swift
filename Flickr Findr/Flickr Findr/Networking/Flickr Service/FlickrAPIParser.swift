//
//  RestAPIParser.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

///Class Description: Parser for the expected response types
final class FlickrAPIParser {
  
  /// Parse Flickr Response
  ///
  /// - Parameter dictionary: of type as dictionary
  /// - Returns: of type Flickr
  static func parseFlickrResonse(dictionary: Dictionary<String, AnyObject>?) -> FlickrServiceResponse {
    
    ///Check for the dicitonary as root object else return nil
    guard let dictionaryObj = dictionary,
    let photos = dictionaryObj[APIResponseKeys.flickr.photos.rawValue] as? Dictionary<String, AnyObject>,
    let photo = photos[APIResponseKeys.flickr.photo.rawValue] as? [Dictionary<String, AnyObject>] else {
      return .failure(error: DataError.invalidJSONData, serviceError: nil)
    }
    
    ///Parse the Photo Array
    let photoArray: [Photo] = photo.map { dictionary in
      
      let id = dictionary[APIResponseKeys.flickr.id.rawValue] as? String ?? ""
      let farm = dictionary[APIResponseKeys.flickr.farm.rawValue] as? Int ?? 0
      let secret = dictionary[APIResponseKeys.flickr.secret.rawValue] as? String ?? ""
      let server = dictionary[APIResponseKeys.flickr.server.rawValue] as? String ?? ""
      let title = dictionary[APIResponseKeys.flickr.title.rawValue] as? String ?? ""
      let owner = dictionary[APIResponseKeys.flickr.owner.rawValue] as? String ?? ""
      let familyValue = (dictionary[APIResponseKeys.flickr.isFamily.rawValue] as? Int ?? 0).booleanValue()
      let friendValue = (dictionary[APIResponseKeys.flickr.isFriend.rawValue] as? Int ?? 0).booleanValue()
      let publicValue = (dictionary[APIResponseKeys.flickr.isPublic.rawValue] as? Int ?? 0).booleanValue()
      let photoURL = RestAPIHelper.getFlickrPhotoAPI(withFarmId: String(farm),
                                                     serverId: server,
                                                     id: id,
                                                     secretId: secret,
                                                     imageSize: .thumbnail)
      
      ///Create a Photo Object
      let photo = Photo(id: id,
                        farm: farm,
                        secret: secret,
                        server: server,
                        title: title,
                        owner: owner,
                        isPublic: publicValue,
                        isFamily: familyValue,
                        isFriend: friendValue,
                        urlString: photoURL)
      return photo
    }
    
    ///Check for the photo array count
    guard photoArray.count > 0 else {
      return .failure(error: DataError.invalidResponse, serviceError: nil)
    }
    
    //Parse the other related fields
    let page = photos[APIResponseKeys.flickr.page.rawValue] as? Int ?? 0
    let pages = photos[APIResponseKeys.flickr.pages.rawValue] as? Int ?? 0
    let perPage = photos[APIResponseKeys.flickr.perpage.rawValue] as? Int ?? 0
    let total = photos[APIResponseKeys.flickr.total.rawValue] as? String ?? ""
    
    //Create a Photos Object
    let photosObject = Photos.init(page: page, pages: pages, perPage: perPage, total: total , photos: photoArray)
    return .success(photos: photosObject)
  }

  
  /// Parse Error Response
  ///
  /// - Parameter dictionary: is of type Dictionary
  /// - Returns: is of type FlickrServiceResponse, get the response
  static func parseErrorResponse(dictionary: Dictionary<String, AnyObject>?) -> FlickrServiceResponse {
    guard let dictionaryObj = dictionary else {  return .failure(error: DataError.invalidJSONData, serviceError: nil) }
    guard let code = dictionaryObj[APIResponseKeys.flickr.code.rawValue] as? Int,
          let message = dictionaryObj[APIResponseKeys.flickr.message.rawValue] as? String else {
       return .failure(error: DataError.invalidResponse, serviceError: nil)
    }
    let flickrError = FlickrError.init(with: code, message: message)
    return .failure(error: nil, serviceError: flickrError)
  }
}

