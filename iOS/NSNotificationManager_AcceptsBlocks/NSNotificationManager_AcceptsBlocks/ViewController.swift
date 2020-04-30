//
//  ViewController.swift
//  NSNotificationManager_AcceptsBlocks
//
//  Created by Rahul Dubey on 10/21/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let notificationManager: NSNotificatioCenterManager = NSNotificatioCenterManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    notificationManager.addObserver(withObject: self, name: "TestNotifications") { (object) in
      //Type cast the type of the object we want
      print(object)
    }
    
    notificationManager.addObserver(withObject: self, name: "TestNotifications2") { (object) in
      //Type cast the type of the object we want
      print(object)
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  deinit {
    notificationManager.removeObserver(object: self)
  }

  @IBAction func postNotification(_ sender: Any) {
    notificationManager.postNotification(name: "TestNotifications", object: self)
  }
  
  @IBAction func postSecondNotification(_ sender: Any) {
    notificationManager.postNotification(name: "TestNotifications2", object: self)
  }
}

