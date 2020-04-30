//
//  ServiceError.swift
//  Flickr Findr
//
//  Created by Rahul Dubey on 11/16/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

//Error Codes from the Flickr API Service
public enum ErrorCodes: Int {
  case tooManytags = 1
  case unknownUser = 2
  case parameterlessSearch = 3
  case permissionDenied = 4
  case userDeleted = 5
  case flickrAPIUnavailable = 10
  case noValidMachineTags = 11
  case exceededMachineTags = 12
  case searchLimitedToContacts = 17
  case illelegalArguments = 18
  case invalidAPIKey = 100
  case serviceUnavailable = 105
  case writeOperationFailed = 106
  case formatNotFound = 111
  case methodNotFound = 112
  case invalidSOAPEnvelope = 114
  case invalidXMLRPDMethod = 115
  case badURL = 116
}

//Flickr Error class, holds the error messages related to Flickr API
public struct FlickrError {

  ///Flickr Error Code as per the Flickr API
  private let code: Int
  
  ///Flickr Error Message as per the Flickr API
  private let message: String
  
  public var displayMessage: String {
    switch code {
    case ErrorCodes.tooManytags.rawValue:
      return "When performing an 'all tags' search, you may not specify more than 20 tags to join together."
    case ErrorCodes.unknownUser.rawValue:
      return "A user_id was passed which did not match a valid flickr user."
    case ErrorCodes.parameterlessSearch.rawValue:
      return "To perform a search with no parameters (to get the latest public photos, please use flickr.photos.getRecent instead)."
    case ErrorCodes.permissionDenied.rawValue:
      return "The logged in user (if any) does not have permission to view the pool for this group."
    case ErrorCodes.userDeleted.rawValue:
      return "The user id passed did not match a Flickr user."
    case ErrorCodes.flickrAPIUnavailable.rawValue:
      return "The Flickr API search databases are temporarily unavailable."
    case ErrorCodes.noValidMachineTags.rawValue:
      return "The query styntax for the machine_tags argument did not validate."
    case ErrorCodes.exceededMachineTags.rawValue:
      return "The maximum number of machine tags in a single query was exceeded."
    case ErrorCodes.searchLimitedToContacts.rawValue:
      return "The call tried to use the contacts parameter with no user ID or a user ID other than that of the authenticated user."
    case ErrorCodes.illelegalArguments.rawValue:
      return "The request contained contradictory arguments."
    case ErrorCodes.invalidAPIKey.rawValue:
      return "The API key passed was not valid or has expired."
    case ErrorCodes.serviceUnavailable.rawValue:
      return "The requested service is temporarily unavailable."
    case ErrorCodes.writeOperationFailed.rawValue:
      return "The requested service is temporarily unavailable."
    case ErrorCodes.formatNotFound.rawValue:
      return "The requested service is temporarily unavailable."
    case ErrorCodes.methodNotFound.rawValue:
      return "The requested method was not found."
    case ErrorCodes.invalidSOAPEnvelope.rawValue:
      return "The SOAP envelope send in the request could not be parsed."
    case ErrorCodes.invalidXMLRPDMethod.rawValue:
      return "The XML-RPC request document could not be parsed."
    case ErrorCodes.badURL.rawValue:
        return "One or more arguments contained a URL that has been used for abuse on Flickr."
    default:
      return "Unknown Error"
    }
  }
  
  //MARK: - FlickrError Initializer
  public init(with code: Int, message: String) {
    self.code = code
    self.message = message
  }
}
