//: Playground - noun: a place where people can play

import UIKit



class HTMLElement {
  
  let name: String
  let text: String?
  
  lazy var asHTML: () -> String = {
    if let text = self.text {
      return "<\(self.name)>\(text)</\(self.name)>"
    } else {
      return "<\(self.name) />"
    }
  }
  
  init(name: String, text: String? = nil) {
    self.name = name
    self.text = text
  }
  
  deinit {
    print("\(name) is being deinitialized")
  }
  
}


var htmlObj:HTMLElement? = HTMLElement(name: "Hello")
print(htmlObj!.asHTML())


htmlObj = nil


var a = 0
var b = 0
let closure = { [a] in
  print(a, b)
}

a = 10
b = 10
closure()

class SimpleClass {
  var value: Int = 0
  
  deinit {
    print("Deinitialized")
  }
}
var x = SimpleClass()
var y = SimpleClass()
let closure2 = { [x] in
  print(x.value, y.value)
}

x.value = 10
y.value = 10
closure2()
