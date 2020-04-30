//: Playground - noun: a place where people can play

import UIKit


// Storing closures in side a variable

let constantClosure  = {(x: Int) -> Int in x + 5 }

constantClosure(20) // Returns 25

// Storing Closure in an array

let arrayClosure = [constantClosure(5),constantClosure(10),constantClosure(15)]

if let firstElement = arrayClosure.first {
  print("First Closure Array Element", firstElement)
}


// Accept 2 elements as parameters return one element as the sum of 2 paramters

let IntClosure = {(firsrtElement: Int, secondElement: Int) -> Int in
    return firsrtElement + secondElement
}

print("Sum of elements inside a closure is ", IntClosure(5, 5))

let floatClosure = {(firstFloat: Float, secondFloat: Float) -> Float in
  return firstFloat + secondFloat
}

print("Sum of elements inside a closure is ", floatClosure(5.0, 5.0))

