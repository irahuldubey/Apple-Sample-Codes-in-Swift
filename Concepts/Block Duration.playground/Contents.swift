//: Playground - noun: a place where people can play

import UIKit

// Execute a block and know the duration of execution that block

public func blockDuration(_ block: () -> ()) -> TimeInterval{
  let startTime = Date()
  block()
  return Date().timeIntervalSince(startTime)
}


// Usage

blockDuration {
  DispatchQueue.main.async(execute: {
    print("Hello World !")
  })  
}
