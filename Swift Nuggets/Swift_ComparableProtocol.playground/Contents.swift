//: Playground - noun: a place where people can play

import UIKit

//Implementing Comparable Protocol

//Comparable protocol extends Equtable protocol.

//We need to make our protocol Equatable as well if we are making it as Comparable.

//Relations defined as per this protocol are:

/*
public protocol Comparable : Equatable {
  static func < (lhs: Self, rhs: Self) -> Bool
  static func <= (lhs: Self, rhs: Self) -> Bool
  static func >= (lhs: Self, rhs: Self) -> Bool
  static func > (lhs: Self, rhs: Self) -> Bool
}
*/

//In this example lets use < operator to show our comparable protocol

//Below 2 will have default implementations

/*
public func > <T : Comparable>(lhs: T, rhs: T) -> Bool {
  return rhs < lhs
}
public func <= <T : Comparable>(lhs: T, rhs: T) -> Bool {
  return !(rhs < lhs)
}
public func >= <T : Comparable>(lhs: T, rhs: T) -> Bool {
  return !(lhs < rhs)
}
*/


struct Person  {
  
  var firstName: String
  var lastName: String
  var age: Int
  
  init(withFirstName fname : String, lastName lname: String, andAge age: Int ) {
    self.firstName = fname
    self.lastName = lname
    self.age = age
  }
  
}

//let's make this struct comparable by Age

extension Person: Comparable {
  
  static func < (lhs: Person, rhs: Person) -> Bool {
    return lhs.age < rhs.age
  }
  
  //If we don't define the equatable protocol here it will throw a compiler error
  
  //Let's implement equatable now
  
  static func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.firstName == rhs.firstName &&
           rhs.lastName == rhs.lastName
           rhs.age      == rhs.age
  }
}

//Usage

let rahul = Person(withFirstName: "Rahul", lastName: "Dubey", andAge: 28)
let deepak = Person(withFirstName: "Deepak", lastName: "Kolluri", andAge: 29)

let deepakIsElder = rahul.age < deepak.age //Returns true 



