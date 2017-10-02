//
//  HomeViewController.swift
//  AuthTouchId
//
//  Created by Rahul Dubey on 10/1/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

  @IBOutlet weak var username: UILabel!
  @IBOutlet weak var password: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    
  }
  
  deinit {
    print("Deinitialized Home View Controller")
  }
  
  @IBAction func retrieveUserInfo(_ sender: Any) {
    
    //Get the username and password for further processing...
    KeychainItem.sharedInstance.retrieveValueFromKeychain { (username, password) in
      
      DispatchQueue.main.async {
        if let username = username {
          self.username.text = username
        }
        
        if let password = password {
          self.password.text = password
        }
      }
    }
  }
}
