//: Playground - noun: a place where people can play
//Author: Filiz Kurban

import UIKit
import Foundation

//Declare Identity protocol with id String
protocol Identity {
    var id:String { get set }
}


//Declare a ToDo class that has a text member of type String, and conforms to Identity protocol
class ToDo: Identity {
    var id: String

    init(id: String) {
        self.id = id
    }
 }

//Demonstrate adding / removing of ToDo items.
class ToDoList {
    var todoList = [String]()

    func add(newToDo: String) {
        todoList.append(newToDo)
    }

    func remove(index: Int) {
        todoList.remove(at: index)
    }
}


//Define ObjectStore protocol with these functions: add:, remove:, objectAtIndex:, count, allObjects.
protocol ObjectStore {
    associatedtype Object

    func add(newObject: Object)
    func remove(index: Int)
    func objectAtIndex(index: Int) -> Object
    func count() -> Int
    func allObjects() -> [Object]
}



//Create Store class that will conform to ObjectStore protocol and implement required methods
//Notes: adherence to the protocol ObjectStore enables the data encapsulation in below example
class Store: ObjectStore {
    typealias Object = String
    private var objects = [Object]()

    func add(newObject: Object) {
        objects.append(newObject)
    }

    func remove(index: Int) {
        objects.remove(at: index)
    }

    func objectAtIndex(index: Int) -> Object {
        return objects[index]
    }

    func count() -> Int {
        return objects.count
    }

    func allObjects() -> [Object] {
        return self.objects
    }
}


// Mark - Test
let store = Store()

store.add(newObject: "Pick up dry cleaning")
store.count()
print(store.allObjects())







