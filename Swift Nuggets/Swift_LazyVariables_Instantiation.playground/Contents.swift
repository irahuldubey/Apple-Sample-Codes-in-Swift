//: Playground - noun: a place where people can play

import UIKit

/*****************************************************************************************************************/
/**************************************** Verify lazy variables Memory *******************************************/
print("********************************* Verify lazy variables Memory *************************************************")

class LazyClass {
  
  var firstVariable: String = "Intial Value"
  
  lazy var secondVariable: String = {
    print("Instantiated secondVariable")
    return firstVariable + " with" + "Second Variable"
  }()
  
  init(with variable: String) {
    print("Entered Init")
    self.firstVariable = variable
    print("Leave Init")
  }
  
  func appendFirstSecondVariable() {
    print("\(firstVariable) + \(secondVariable)")
  }
}

let lazyInstance = LazyClass(with: "Lazy Class Instantiated")

//print(lazyInstance.appededString())
print(lazyInstance.secondVariable)

/*****************************************************************************************************************/
print("Lazy variables are instantiated only when it is called not in the init of the class")



