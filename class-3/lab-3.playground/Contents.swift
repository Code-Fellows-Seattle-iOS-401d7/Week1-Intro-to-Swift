//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"






// Declare Identity protocol with id String 

protocol Identity {
    var id: String { get }
    
}




// Declare a ToDo class that has a text member of type String, and conforms to Identity protocol

class ToDo: Identity {
    internal var id: String = ""

}




// Define ObjectStore protocol with these functions: add:, remove:, objectAtIndex:, count, allObjects.


protocol ObjectStore {
    
    func add(object: String)
    
    func removeAt(index: Int)
    
    func objectAtIndex(index: Int) -> String
    
    func count() -> Int
    
    func allObjects() -> [String]
    
    
}



// Create Store class that will conform to ObjectStore protocol and implement required methods


class Store: ObjectStore {
    
    private var list = ["milk", "eggs", "bacon"]
    
    func add(object: String) {
        list.append(object)
    }
    
    func removeAt(index: Int) {
        list.remove(at: index)
    }
    
    func objectAtIndex(index: Int) -> String {
        return list[index]
    }
    
    func count() -> Int {
        return list.count
    }
    
    func allObjects() -> [String] {
        return list
    }
}




// Demonstrate adding / removing of ToDo items.

var coreysStore = Store()

coreysStore.allObjects()

coreysStore.add(object: "broccoli")

coreysStore.allObjects()

coreysStore.removeAt(index: 0)

coreysStore.allObjects()



