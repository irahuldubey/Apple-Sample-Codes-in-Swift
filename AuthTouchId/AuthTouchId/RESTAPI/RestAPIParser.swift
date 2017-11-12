//
//  RestAPIParser.swift
//  RESTAPI
//
//  Created by Rahul Dubey on 10/22/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit


/// Dictionary describing a JSON object
public typealias JSONDictionary = [String: AnyObject]
public typealias JSONArray = [AnyObject]

final class RestAPIParser: NSObject {

  static func parseUserResonse(dictionary: Dictionary<String, AnyObject>?) -> AnyObject? {
    
    guard let _ = dictionary else { return nil }
    
    return nil
  }
  
  
  static func parseCustomerResonse(dictionary: Dictionary<String, AnyObject>?) -> CustomerDetails? {
    
    guard let dict = dictionary else { return nil }
    
    guard let name = dict["name"] as? String,
      let address = dict["address"] as? String,
      let phone = dict["phone"] as? String,
      let email = dict["email"] as? String,
      let ssn = dict["ssn"] as? String else {
        return nil
    }
    
    return CustomerDetails.init(name: name, ssn: ssn, address: address, phoneNumber: phone, email: email)
  }
  
  static func getCustomerDetailsFromLocal() -> CustomerDetails? {
    if let path = Bundle.main.path(forResource: "CustomerDetails", ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        
        let dict = RestAPIHelper.parseToDictionary(data)
        
        return RestAPIParser.parseCustomerResonse(dictionary: dict)!
        
      } catch let error {
        print("parse error: \(error.localizedDescription)")
      }
    } else {
      print("Invalid filename/path.")
      return nil
    }
    return nil
  }
}
