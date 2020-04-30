//: Playground - noun: a place where people can play

import UIKit

//Function without a Autoclosure
//When a function is called inside another function and its unnamed its called as closure

func testingClosure( completion: () -> String) {
  print("Executed with", completion())
}

testingClosure { () -> String in
  return "Tested Closure"
}

//Function with Autoclosure
//**********An autoclosure allows you to pass an expression to a function as an argument********//

func testingAutoClosure( completion: @autoclosure () -> String) {
  print("Executed with", completion())
}

//Passed as an expression//
testingAutoClosure(completion: "Tested Autoclosure")