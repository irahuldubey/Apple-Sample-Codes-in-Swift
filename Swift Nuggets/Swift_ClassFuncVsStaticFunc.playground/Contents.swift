//: Playground - noun: a place where people can play

import UIKit


class MyClass{
  class func myFunc(){
    println("myClass")
  }
}

class MyOtherClass: MyClass{
  override class func myFunc(){
    println("myOtherClass")
  }
}

var x: MyClass = MyOtherClass()
x.myFunc() 