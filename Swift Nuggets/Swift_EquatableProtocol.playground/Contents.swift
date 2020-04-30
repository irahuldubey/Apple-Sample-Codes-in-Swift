//: Playground - noun: a place where people can play

import UIKit

//Equatable Prtocol in Swift

//What is Equatable Protocol?

/**

If you want to make a custom type equatable we need to implement this
protocol. It is used for equality or inequality.

All the basic types in swift already use this protocol.
 
**/

//Let try this protcol for our own type (Struct).

struct Person {
  
  let firstName: String
  let lastName: String
  
  init(withFirstName fname: String, andLastName lname: String) {
    self.firstName = fname
    self.lastName = lname
  }
  
}


//Let's implement Equatable protocol to Person Struct

extension Person {
  
  //Check for both the properties and return if both the objects are same
  static func ==(lhs: Person, rhs: Person) -> Bool {
    
    return
          lhs.firstName == rhs.firstName &&
          lhs.lastName  == rhs.lastName
  }
}

let rahulDubey = Person.init(withFirstName: "Rahul", andLastName: "Dubey")

let cloneRahulDubey = rahulDubey

if rahulDubey == cloneRahulDubey {
  print("Objects are equal")
}
else{
  print("Objects are not equal")
}

//Any two instances that compare equally can be used interchangeably in any code that depends on their values

/**Equatable must satisfy below conditions

a == a is always true (Reflexivity)
a == b implies b == a (Symmetry)
a == b and b == c implies a == c (Transitivity)

Same applies for InEquality as well != **/

