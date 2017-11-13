//: Playground - noun: a place where people can play

import UIKit

let userQueue = DispatchQueue.global(qos: .userInitiated)
let defaultQueue = DispatchQueue.global()


func slowAdd(_ input: (Int, Int)) -> Int {
  sleep(1)
  return input.0 + input.1 // We can access 1st and 2nd paramters by .0 and .1
}

userQueue.async {
  let result = slowAdd((1,2))
  result
}

// Async dispatch as async function with arguments of input queue and completion handler

func async(_ input: (Int, Int),
           runQueue: DispatchQueue,
           completionQueue: DispatchQueue,
           completionHandler: @escaping (Int) -> ()) {
  
  runQueue.async {
    let result = slowAdd(input)
    completionQueue.async(execute: {
      completionHandler(result)
    })
  }
}

async((1,2), runQueue: userQueue, completionQueue: defaultQueue) { (result) in
  print(result)
}






