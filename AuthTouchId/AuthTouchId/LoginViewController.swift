//
//  ViewController.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/1/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//


import UIKit

//Imported this framework for touch id sign up
import LocalAuthentication

class LoginViewController: UIViewController {
  
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  @IBOutlet weak var touchIDSwitch: UISwitch!
  @IBOutlet weak var touchIDLabel: UILabel!
  
  private var isTouchIdEnabled: Bool = false
  private let touchIdAuth = TouchIDAuth()
  
  //MARK: View Life Cycle
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    setupUserInterface()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  deinit {
    print("Deinitialized Login View Controller")
  }
  
  private func setupUserInterface() {
    //Check if touch id is available
    if !touchIdAuth.canEvaluatePolicy() {
        //Hide the touch id buttons
        touchIDSwitch.isHidden = true
        touchIDLabel.isHidden = true
    }
  }
 
  @IBAction func enableTouchID(_ sender: Any) {
    
    guard let switchValue = sender as? UISwitch else { return }
    
    if switchValue.isOn {
      isTouchIdEnabled = true
    }
    else {
      isTouchIdEnabled = false
    }
    
  }
  
  @IBAction func login(_ sender: Any) {
    
    guard isValidCredentials() else {
      return
    }
    
    let validUsername = self.userNameTextField.text!
    
    KeychainItem.sharedInstance.validateItemInKeychain(forUsername: validUsername) { (success) in
      if success {
        self.showHomeViewController()
      }
      else{
        if self.isTouchIdEnabled {
          self.authenticateUserWithTouchID()
        }
        else{
          self.showHomeViewController()
        }
      }
    }
  }
  
  private func authenticateUserWithTouchID() {
    
    touchIdAuth.authenticateUser { (message) in
      if let message = message {
          self.showAlert(withMessage: message)
      }
      else{
        
        //Delete already existing keychain items
        KeychainItem.sharedInstance.deleteUserInfoFromKeychain(withUsername: self.userNameTextField.text!)

        //Save the current item in the keychain
        KeychainItem.sharedInstance.saveUserInfoToKeychain(withUsername: self.userNameTextField.text!,
                                                           andPassword: self.passwordTextField.text!,
                                                           completion: {
            self.showHomeViewController()
        })
      }
    }
  }
  
  private func showHomeViewController() {
    DispatchQueue.main.async {
      self.performSegue(withIdentifier: Utilities.homeSegue, sender: self)
    }
  }
  
  private func isValidCredentials() -> Bool {

    userNameTextField.resignFirstResponder()
    passwordTextField.resignFirstResponder()
    
    guard let username = userNameTextField.text, username.characters.count > 0,
      let password = passwordTextField.text, password.characters.count > 0 else {
        self.showAlert(withMessage: "Please enter valid credentials")
        return false
    }
    
    return true
  }
  
  private func showAlert(withMessage message: String) {

    let alert = UIAlertController(title: "Authentication Failed", message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alert.addAction(action)
    
    DispatchQueue.main.async {
      self.present(alert, animated: true, completion: nil)
    }
  }
}
