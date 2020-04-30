//: Playground - noun: a place where people can play

import UIKit


class Employee {
  
  var employeeArray = ["Alex", "Jorge", "Andrew"]
  
  func printUsingForLoop(){
    for employee in employeeArray {
      print("Employee", employee)
      if employee == "Alex" {
        return
      }
    }
  }
  
  func printUsingForEach() {
    employeeArray.forEach { (employee) in
      print("Employee", employee)
      if employee == "Alex" {
        return
      }
    }
  }
}


let emp = Employee()

emp.printUsingForLoop()
print("***********************")
emp.printUsingForEach()

