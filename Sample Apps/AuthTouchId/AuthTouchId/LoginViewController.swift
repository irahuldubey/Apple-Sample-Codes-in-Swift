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

class LoginViewController: UIViewController, NVActivityIndicatorViewable {
  
//  var animatedView: NVActivityIndicatorView!
  var loginViewModel: LoginViewModel!
  
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!

  @IBOutlet weak var touchIDSwitch: UISwitch!
  @IBOutlet weak var touchIDLabel: UILabel!
  
  private var isTouchIdEnabled: Bool = false
  private var saveUserID: Bool = false
  private let touchIdAuth = TouchIDAuth()
  
  //MARK: View Life Cycle
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    
    if let username = UserDefaults.standard.object(forKey: "Username") as? String{
      userNameTextField.text = username

    }
    
    //Set up user interface
    setupUserInterface()
  }

  private func setUpActivityIndicator() {
    let size = CGSize(width: 50, height: 50)
    startAnimating(size, message: "Logging In", type: NVActivityIndicatorType(rawValue: 23)!)
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
    
    if switchValue.tag == 2 {
      if switchValue.isOn {
        isTouchIdEnabled = true
      }
      else {
        isTouchIdEnabled = false
      }
    }
    else{
      if switchValue.isOn {
        saveUserID = true
      }
      else {
        saveUserID = false
      }
    }
  }
  
  @IBAction func login(_ sender: Any) {
  
    guard isValidCredentials() else {
      return
    }
    
    setUpActivityIndicator()
    
    let validUsername = self.userNameTextField.text!
    
    if saveUserID {
      UserDefaults.standard.set(validUsername, forKey: "Username")
    }
    
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
      
      self.loginViewModel = LoginViewModel.init(withUser: Customer.init(withUsername: self.userNameTextField.text!,
                                                                   andPassword:  self.passwordTextField.text!))
      self.stopAnimating()
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
      let storyboard = UIStoryboard(name: "Main", bundle: nil)
      let viewController = storyboard.instantiateViewController(withIdentifier :"HomeId") as! HomeViewController
      viewController.customer = Customer.init(withUsername: self.userNameTextField.text!, andPassword: self.passwordTextField.text!)
      self.present(viewController, animated: true)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == Utilities.homeSegue{
      if let homeVC = segue.destination as? HomeViewController {
        if let username = self.userNameTextField.text {
          homeVC.username = username
        }
      }
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
