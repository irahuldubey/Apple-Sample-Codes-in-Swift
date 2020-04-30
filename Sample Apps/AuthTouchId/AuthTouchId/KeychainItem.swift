
//
//  Authetication.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/1/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

//Static class to hold the loggedIn values
class KeychainItem {
  
  static var sharedInstance = KeychainItem()

  //Primary key in the keychain database
  private let attributeService = "AuthTouchId"
  private var attributeAccount: String = ""
  
  //Check if the user is already loggedin by comparing the values in keychain
  var isUserLoggedIn: Bool = false
  
  func saveUserInfoToKeychain(withUsername username: String, andPassword password: String, completion: @escaping () -> Void) {
    
    attributeAccount = username
    
    let attributeValue = password.data(using: .utf8)!
    
    let accessControl =
      SecAccessControlCreateWithFlags(kCFAllocatorDefault,
                                      kSecAttrAccessibleWhenUnlockedThisDeviceOnly,
                                      .userPresence,
                                      nil)!

    let insert_query: NSDictionary = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccessControl: accessControl,
      kSecValueData: attributeValue,
      kSecUseAuthenticationUI: kSecUseAuthenticationUIAllow,
      kSecAttrService: attributeService,
      kSecAttrAccount: attributeAccount
    ]
    
    let insert_status: OSStatus = SecItemAdd(insert_query as CFDictionary, nil)
    
    if insert_status == errSecSuccess {
      print("Insertion success : value saved to Keychain")
      completion()
    } else {
      print("Insertion failure \(insert_status).")
    }
  }
  
  func deleteUserInfoFromKeychain(withUsername username: String) {
    
    let delete_query: NSDictionary = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrService: attributeService,
      kSecAttrAccount: username,
      kSecReturnData: false
    ]
    
    let delete_status = SecItemDelete(delete_query)
    
    if delete_status == errSecSuccess {
      print("Delete Success: value has been deleted")
    } else if delete_status == errSecItemNotFound {
      print("Delete Failure: Item Not Found")
    } else {
      print("Delete Failure: \(delete_status).")
    }
  }
  
  func retrieveValueFromKeychain(completionHandler: @escaping (Bool) -> Void) {
    
    DispatchQueue.main.async {
      let select_query: NSDictionary = [
        kSecClass: kSecClassGenericPassword,
        kSecAttrService: self.attributeService,
        kSecAttrAccount: self.attributeAccount,
        kSecReturnData: true,
        kSecUseOperationPrompt: "Scan Bio Profile for instant card approval"
      ]
      
      var extractedData: CFTypeRef?
      let select_status = SecItemCopyMatching(select_query, &extractedData)
      
      if select_status == errSecSuccess {
        
        if let retrievedData = extractedData as? Data,
          let password = String(data: retrievedData, encoding: .utf8) {
          
          print("Password value : \(password)")
          
          completionHandler(true)
          
        } else {
          print("Invalid Data")
        }
      } else if select_status == errSecUserCanceled {
        print("Operation has been cancelled.")
        completionHandler(false)
      } else {
        print("Failed with error status\(select_status).")
        completionHandler(false)
      }
    }
  }
  
  func validateItemInKeychain(forUsername username: String, completionHandler: @escaping (Bool) -> Void) {
    
    DispatchQueue.global().async {
      let select_query: NSDictionary = [
        kSecClass: kSecClassGenericPassword,
        kSecAttrService: self.attributeService,
        kSecAttrAccount: username,
        kSecReturnData: true,
        kSecUseAuthenticationUI: kSecUseAuthenticationUISkip
      ]
      
      var extractedData: CFTypeRef?
      let select_status = SecItemCopyMatching(select_query, &extractedData)
      
      if select_status == errSecSuccess {
        
        if let retrievedData = extractedData as? Data,
          let password = String(data: retrievedData, encoding: .utf8) {
          
          print("Password value : \(password)")
          
          completionHandler(true)
          
        } else {
          print("Invalid Data")
          completionHandler(false)
        }
      } else if select_status == errSecUserCanceled {
        print("Operation has been cancelled.")
        completionHandler(false)
      } else {
        print("Failed with error status\(select_status).")
        completionHandler(false)
      }
    }
  }
  
  func updateUserInfoInKeychain(withUsername username: String, andPassword password: String) {
    
  }

}
