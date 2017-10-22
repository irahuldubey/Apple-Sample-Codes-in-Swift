//
//  ViewController.swift
//  NSNotification
//
//  Created by Rahul Dubey on 10/21/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let kNotificationConstant = "SampleNotification"
  let kNotificationConstantBlock = "BlockNotification"
  
  override func viewDidLoad() {
    super.viewDidLoad()

    
    //Added notification observer for the notification name "SampleNotification"
    NotificationCenter.default.addObserver(self, selector: #selector(executeNotification), name: NSNotification.Name(rawValue: kNotificationConstant), object: nil)
    
    //Added notification observer for the notification name "kNotificationConstantBlock" - Block bases notification.
    NotificationCenter.default.addObserver(forName: NSNotification.Name.init(rawValue: kNotificationConstantBlock), object: nil, queue: OperationQueue.main) { (notification) in
      self.view.backgroundColor = .red
    } 
  }
  
  //Method that execute the notifcation when notification with the given name has been posted.
  func executeNotification() {
    print("Executed \(kNotificationConstant)")
  }

  //Deinitalizer, remove the observer of the notification
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //Action on the button click to post the block notification.
  @IBAction func postBlockNotification(_ sender: Any) {
    NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: kNotificationConstantBlock), object: self)
  }

  //Action on the button click to post the notification.
  @IBAction func postNotification(_ sender: Any) {
    NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: kNotificationConstant), object: self)
  }
}
