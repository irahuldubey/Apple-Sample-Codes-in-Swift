//: Playground - noun: a place where people can play

import UIKit

///Create Custom Error Type in Swift
enum CustomError: Error {
  case invalidData
}

class Person {
  /// is of type String, name of the Person
  let name: String
  /// is of type String, age of the Person
  let age: String
  
  ///Initializer with name and age of the Person
  init(with name: String, age: String) {
    self.name = name
    self.age = age
  }
  
  ///Throw and return from a function as String
  func nameAge() throws -> String? {
    if name.isEmpty {
      throw CustomError.invalidData
    }
    return name + ", " + age
  }
  
  ///Wrap the throwing function inside another throwing function
  func throwableNameAndAge() throws {
    try personObject.nameAge()
  }
}

///Create an instance of Person Class
let personObject = Person.init(with: "", age: "28")

/*****
 1.
 Do Catch Statement ****/
///Handling errors with Do, Catch

do {
  try personObject.throwableNameAndAge()
}
catch CustomError.invalidData {
  print("Error thrown as Invalid Data")
}

/*****
 2.
 Coverting Error to Optional Values
 ****/

let nameAgeValue = try? personObject.nameAge()

///Returns nil value
print(nameAgeValue as Any)

/*****
 3.
 You can also use forced unwrap try! if you are sure that function will return a value instead of a throw type.
 *******/

let anonymousObject = Person.init(with: "Rahul Dubey", age: "28")
let nameAge = try! anonymousObject.nameAge() ///try! is used as we are sure calling func will return a value.
print(nameAge as Any)

/*****
 3.
 Rethrows ... If a function parameter
 *******/

func logFunction(description: () throws -> String) rethrows -> () {
  print(try description())
}

enum ResultType<E, U> {
  case success(E)
  case failure(U)
}

func checkGenericTypeResult() -> ResultType<String, String> {
  return .success("Hello")
}

switch checkGenericTypeResult() {
case .success(let value):
  print(value)
  break
default:
  break
}



