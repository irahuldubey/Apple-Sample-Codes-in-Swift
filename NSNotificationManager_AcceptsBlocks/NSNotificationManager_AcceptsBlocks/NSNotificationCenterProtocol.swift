//
//  NSNotificationCenterProtocol.swift
//  NSNotificationManager_AcceptsBlocks
//
//  Created by Rahul Dubey on 10/21/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation


//Protocol defines the observer method to be used in the NSNotificationCenter

protocol NSNotificatioCenterProtocol {
  
  //
  /// Protocol method to add the observer for the notification
  ///
  /// - Parameters:
  ///   - object: Object need to be added to the notification center
  ///   - name: Notification Name
  ///   - observerCompletionHandler: Blocks accepted by the NotificationCenter
  func addObserver(withObject object: AnyObject, name: String, observerCompletionHandler: @escaping (Any?) ->() )
  
  
  /// Protocol method to post the notification with the given name
  ///
  /// - Parameters:
  ///   - name: Notification Name
  ///   - object: Notification Object
  func postNotification(name: String, object: Any?)
  
  
  /// Protocol method to remove the observer
  ///
  /// - Parameter object: Notification Object
  func removeObserver(object: AnyObject)
  
}
