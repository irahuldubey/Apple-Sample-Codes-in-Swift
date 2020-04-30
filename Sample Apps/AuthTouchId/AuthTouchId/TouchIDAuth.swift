//
//  TouchIDAuth.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/1/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//


import LocalAuthentication

class TouchIDAuth {
  
  let context = LAContext()
  
  func canEvaluatePolicy() -> Bool {
    
    //Boolean to check if the policy is valid
    var isValidPolicy: Bool = false
    
    //Instance of the policy
    var policy: LAPolicy? = nil
    
    // Depending the iOS version we'll need to choose the policy we are able to use
    if #available(iOS 9.0, *) {
      // iOS 9+ users with Biometric and Passcode verification
      policy = .deviceOwnerAuthentication
    } else {
      // iOS 8+ users with Biometric and Custom (Fallback button) verification
      context.localizedFallbackTitle = "Enter Manually"
      policy = .deviceOwnerAuthenticationWithBiometrics
    }
    
    if let _ = policy {
      isValidPolicy = true
    }
    
    return isValidPolicy
  }
  
  func authenticateUser(completion: @escaping (_ message: String?) -> Void) {
    
    guard canEvaluatePolicy() else {
      return
    }
    
    context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                           localizedReason: "Logging in with Touch ID") { (success, error) in
                            if success {
                              completion(nil)
                            } else {
                              
                              if let error = error {
                                let errorMesasge = self.getErrorMessage(withError: error as NSError)
                                completion(errorMesasge)
                              }
                              else{
                                completion("Unknown Error")
                              }
                            }
    }
  }
  
  private func getErrorMessage(withError error: NSError) -> String? {
    var message: String? = nil
    switch(error) {
    case LAError.authenticationFailed:
      message = "There was a problem verifying your identity."
    case LAError.userCancel:
      message = "Authentication was canceled by user."
    case LAError.userFallback:
      message = "The user tapped the fallback button"
    case LAError.systemCancel:
      message = "Authentication was canceled by system."
    case LAError.passcodeNotSet:
      message = "Passcode is not set on the device."
    case LAError.touchIDNotAvailable:
      message = "Touch ID is not available on the device."
    case LAError.touchIDNotEnrolled:
      message = "Touch ID has no enrolled fingers."
    case LAError.touchIDLockout:
      message = "There were too many failed Touch ID attempts and Touch ID is now locked."
    case LAError.appCancel:
      message = "Authentication was canceled by application."
    case LAError.invalidContext:
      message = "LAContext passed to this call has been previously invalidated."
    default:
      message = "Touch ID may not be configured"
      break
    }
    return message
  }
}
