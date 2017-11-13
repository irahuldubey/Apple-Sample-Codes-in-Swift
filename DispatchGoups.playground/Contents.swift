//: Playground - noun: a place where people can play

import UIKit

// Dispatch Group

// Create a Dispatch Group

let dispatchGroup = DispatchGroup.init()

// Create a global queue : Default Global Queue

let globalQueue = DispatchQueue.global()

// Create a Serial Queue : Default serial queue

let serialQueue = DispatchQueue.init(label: "com.mySerialQueue.new")

// Execute Global Queue with Dispatch Group

globalQueue.async(group: dispatchGroup, execute: {
    print("Executed Global Queue with Dispatch Group")
})

// Execute Serial Queue with Dispatch Group

serialQueue.async(group: dispatchGroup, execute: {
    print("Executed Serial Queue with Dispatch Group")
})

// Notify when tasks are completed

dispatchGroup.notify(queue: DispatchQueue.main) {
  print("Executed Group Notify")
}

dispatchGroup.wait(timeout: DispatchTime.distantFuture)

