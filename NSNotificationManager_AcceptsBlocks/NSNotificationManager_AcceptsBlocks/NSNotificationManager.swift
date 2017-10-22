//
//  NSNotificationManager.swift
//  NSNotificationManager_AcceptsBlocks
//
//  Created by Rahul Dubey on 10/21/17.
//  Copyright © 2017 Rahul Dubey. All rights reserved.
//

import Foundation

final class NSNotificatioCenterManager: NSNotificatioCenterProtocol {
  
  //Create a observer table for the notification which will be posted to the notification center.
  //Created a NSHashMapTable with weak reference objects because we need to have a weak reference between the key and the object. So when the key or the object goes away from the memory then the that value is removed from the Table
  
  private var observerHandlers: NSMapTable<AnyObject, NSMutableArray> = NSMapTable.weakToStrongObjects()

  public init() {
    print("Initialized NSNotificatioCenterManager")
  }
  
  deinit {
    print("Denitialized NSNotificatioCenterManager")
  }
  
  func addObserver(withObject object: AnyObject, name: String, observerCompletionHandler: @escaping (Any?) -> ()) {
    
    let observer = NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: name), object: object, queue: OperationQueue.main) { (notification) in
      
      //Return the completion hadnler with the object
      observerCompletionHandler(notification.object)
    }
    
    var observerHandlersArray: NSMutableArray! = self.observerHandlers.object(forKey: object)
    
    if observerHandlersArray == nil {
      observerHandlersArray = NSMutableArray()
      observerHandlers.setObject(observerHandlersArray, forKey: object)
    }
    
    observerHandlersArray.add(observer)
    
    
  }
  
  func postNotification(name: String, object: Any?) {
    NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: name), object: object)
  }
  
  func removeObserver(object: AnyObject) {
    if let observerHandler = observerHandlers.object(forKey: object) {
      for handler in observerHandler {
        NotificationCenter.default.removeObserver(handler)
      }
      observerHandlers.removeObject(forKey: object)
    }
  }
}
