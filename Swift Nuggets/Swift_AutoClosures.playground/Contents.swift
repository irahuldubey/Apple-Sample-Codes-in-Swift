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



var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

//let customerProvider = { customersInLine.remove(at: 0) }
//print(customerProvider())

func serve(customer: @autoclosure () -> String) {
    print("hey \(customer())")
}

// -- without autoclosure
//serve(customer: { customersInLine.remove(at: 0) })

// -- with autoclosure
serve(customer: customersInLine.remove(at: 0))

// -- with @autoclosure and @escaping

var customerLine1 = ["Barry", "Daniella"]

var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders(customerLine1.remove(at: 0))


for cusProvider in customerProviders {
    print(cusProvider())
}
