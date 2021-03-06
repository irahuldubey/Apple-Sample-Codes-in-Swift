//: Playground - noun: a place where people can play

import UIKit

import Foundation

class CancelableTask {
  
  typealias Handler = () -> ()
  
  static var cancelled: Bool = false
  
  func cancelOperation() {
    CancelableTask.cancelled = true
  }
  
  public static func dispatch(queue: DispatchQueue, completionHandler: @escaping Handler) -> CancelableTask {
    let task = CancelableTask()
    if CancelableTask.cancelled == false {
      queue.async{
        completionHandler()
      }
    }
    return task
  }
}


