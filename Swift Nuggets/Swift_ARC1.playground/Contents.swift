import UIKit

class Person {
    
    let name : String
    
    init(name: String) {
        self.name = name
        print("***** Person Initialized \(name) *****")
    }
    
    deinit {
        print("***** Person DeInitialized *****")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person.init(name: "A")
//reference2 = Person.init(name: "B")
//reference3 = Person.init(name: "C")

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

print(reference3?.name)

reference3 = nil


// How is strong references created?

class Person1 {
    
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Person1 \(name) is being deinitialized")
    }
}


class Apartment {
    
    let unit: String
    
    init(unit: String) {
        self.unit = unit
    }
    
    unowned var tenant: Person1?
    
    deinit {
        print("Person1 Apartment\(unit) is being deinitialized ")
    }
}


var john: Person1?
var unit4A: Apartment?

john = Person1.init(name: "John ---")
unit4A = Apartment.init(unit: "4A")

john?.apartment = unit4A

john = nil
unit4A = nil
