/* * * * * * * * * * * * *
 * John Hearn            *
 * Code Fellows 401: iOS *
 * October 2016          *
 * * * * * * * * * * * * */

/*
 * Declare Identity protocol with id String
 * Declare a ToDo class that has a text member of type String, and conforms to Identity protocol
 * Define ObjectStore protocol with these functions: add:, remove:, objectAtIndex:, count, allObjects.
 * Create Store class that will conform to ObjectStore protocol and implement required methods
 * Demonstrate adding / removing of ToDo items.
 */


import UIKit

protocol Identity{
    var id: String { get set }
    associatedtype Description
    func description() -> Description
}
extension Identity{
    func description() -> String {
        // Protocol method is optional by providing default behavior
        return String(describing: self)
    }
}

protocol ObjectStore{
    associatedtype Index
    associatedtype StoredObject
    associatedtype Description

    func add(_ object: StoredObject )
    func remove(_ object: StoredObject )
    func objectAtIndex(_ index: Index ) -> StoredObject
    func count() -> Index
    func allObjects() -> [StoredObject]
    func description() -> Description

}
extension ObjectStore{
    func description() -> String {
        return String(describing: self)
    }
}

class ToDo: Identity {
    var id: String = ""
    var text: String = ""
    typealias Description = String

    init(id: String, text: String){
        self.id = id
        self.text = text
    }

}

class Store: ObjectStore {
    typealias Index = Int
    typealias StoredObject = ToDo
    typealias Description = String

    var store: [ToDo]

    func add(_ todo: ToDo){
        self.store.append(todo)
    }

    func remove(_ todo: ToDo){
        for ii in 0..<self.store.count {
            if self.store[ii].id == todo.id {
                self.store.remove(at: ii)
                break //good enough until we verify id uniquesness
            }
        }
    }

    func objectAtIndex(_ index: Int) -> ToDo {
        return self.store[index]
    }

    func count() -> Int{
        return self.store.count
    }

    func allObjects() -> [ToDo]{
        return self.store
    }

    init(todo: ToDo){
        self.store = [ todo ]

    }

}


let myToDoItem1 = ToDo(id: "0", text: "test init")
let myToDoItem2 = ToDo(id: "1", text: "test add")
let myToDoItem3 = ToDo(id: "2", text: "test remove")
let myToDoItem4 = ToDo(id: "3", text: "finish assignment 3")


let myToDoList = Store(todo: myToDoItem1)

myToDoList.add(myToDoItem2)
myToDoList.add(myToDoItem3)
myToDoList.add(myToDoItem4)

myToDoList.count()
myToDoList.allObjects()
myToDoList.remove(myToDoItem2)
myToDoList.count()
myToDoList.allObjects()




