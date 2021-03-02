import UIKit

protocol Screen {
    associatedtype ItemType
    var items: [ItemType] { get set }
}

class MainScreen: Screen {
    typealias ItemType = String // Here we are explicitly specifying what kind if ItemType
    var items: [String] = [String]()
}

// Above code can also be written as below

class MainScreen2: Screen {
    var items: [String] = [String]() // Swift will automatically know and map the ItemType
}

// Adding a simple constraint

protocol Item {
    init(filename: String)
}

struct Movie: Item {
    var filename: String // Structs automatic adapts init(filename: String)
}

struct Song: Item {
    var filename: String // Structs automatic adapts init(filename: String)
}

protocol Screen2 {
    associatedtype ItemType: Item
    var items: [ItemType] { get set }
}

class MainScreen3: Screen2 {
    var items = [Movie]() // Adding it as string wont help because we have added a constraint for the item type to be Movie or Song
}

// Swift 4.1 introduced the ability to make associated type constraints recursive: an associated type can be constrained so that it must also be of the same protocol.

protocol Screen3 {
    associatedtype ItemType: Item
    associatedtype ChildScreen: Screen3
    var items: [ItemType] { get set }
    var childScreens: [ChildScreen] { get set }
}

//We just created a recursive associated type constraints: part of the protocol depends on itself. Such a constraint wasn’t possible before Swift 4.1, so you had to implement extra protocols to create the correct restriction.


class MainScreen4: Screen3 {
    var items = [Movie]()
    var childScreens = [MainScreen4]()
}

protocol Screen4 {
    associatedtype ItemType: Item
    associatedtype ChildScreen: Screen4 where ChildScreen.ItemType == ItemType
    var items: [ItemType] { get set }
    var childScreens: [ChildScreen] { get set }
}

/*
class MainScreen: Screen {
    var items = [Movie]()
    var childScreens = [CategoryScreen]()
}

class CategoryScreen: Screen {
    var items = [Movie]()
    var childScreens = [DetailScreen]()
}

class DetailScreen: Screen {
    var items = [Movie]()
    var childScreens = [DetailScreen]()
}
*/

class MainScreen5<T: Item>: Screen4 {
    var items = [T]()
    var childScreens = [CategoryScreen<T>]()
}

class CategoryScreen<T: Item>: Screen4 {
    var items = [T]()
    var childScreens = [DetailScreen<T>]()
}

class DetailScreen<T: Item>: Screen4 {
    var items = [T]()
    var childScreens = [DetailScreen<T>]()
}
