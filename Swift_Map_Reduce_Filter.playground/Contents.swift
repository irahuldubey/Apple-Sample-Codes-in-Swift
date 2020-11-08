import UIKit

// Swift Map function --

/* Transform each and every element in the array or any collections types */

let values = [2.0, 4.0, 5.0, 7.0]

let mappedValue1 = values.map { (value: Double) -> Double in return value * value }
let mappedValue2 = values.map { value in value * value }
let mappedValue3 = values.map { $0 * $0 }

print(mappedValue1)
print(mappedValue2)
print(mappedValue3)

let milesToPoint = ["point1": 120.0, "point2": 50.0, "point3": 70.0]

let mappedMilesToPoint1 = milesToPoint.mapValues { (value) -> Double in
    return value * 2
}

print(mappedMilesToPoint1)

// Swift Filter function --

/* Use filter to loop over a collection and return an Array containing only those elements that match an include condition. */

let digits = [1, 4, 10, 15]
let filteredDigits = digits.filter({ $0 % 2 == 0 })
let filteredDigits1 = digits.filter { (val) -> Bool in
    return val * 2 == 2
}

print(filteredDigits)
print(filteredDigits1)

// Swift Reduce function --

let items = [2.0,4.0,5.0,7.0]
let totalValue = items.reduce(0, +)

print("Reduce Total Value", totalValue)

let codes = ["abc","def","ghi"]
let text = codes.reduce("", +)

print("Codes --", text)

let names = ["alan","brian","charlie"]
let csv = names.reduce("===") { text, name in "\(text),\(name)" }

let reduceIt = names.reduce("RahulDubey") { "\($0),\($1)" }

print("REDUCE Func -----", reduceIt)

// "abcdcdcc"
