//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//STRUCTS LECTURE

//struct Person{
//    var name: String
//    var age: Int?
//    
//    init(name: String, age: Int? = nil) {
//        self.name = name
//        self.age = age
//    }
//    
//    func ageInDogYears() -> Int {
//    let age = self.age ?? 0
//    return age * 7
//    }
//    
//}
//
//extension Person{
//    
//    init(name: String){
//        self.init(name: name, age: nil)
//    
//    }
//
//}
//
//protocol Identity{
//    
//    var id: String { get set }
//    associatedtype Description
//    
//    func description() -> Description
//    
//    func optionalMethod()
//    func requiredMethod()
//    
//
//}
//
//extension Identity{
//    func description() -> String {
//    return String(describing: self)
//    
//    }
//
//}

//HOMEWORK
//Declare Identity protocol with id String

//Declare a ToDo class that has a text member of type String, and conforms to Identity protocol

//Define ObjectStore protocol with these functions: add:, remove:, objectAtIndex:, count, allObjects.

//Create Store class that will conform to ObjectStore protocol and implement required methods

//Demonstrate adding / removing of ToDo items.

protocol Identity{
    var id: String { get set }

}

class ToDo: Identity
{
    var id: String


    var text: String
    var date: Date?
    
    init(text: String, date: Date?=Date())
    {
        self.id = UUID().uuidString //generates a random string for identification
        self.text = text
        self.date = date
        
    }
}

protocol ObjectStore
{
    
    func add(todo: ToDo)
    func remove(index: Int)
    func todoAtIndex(index: Int) -> ToDo
    func count() -> Int
    func allObjects() -> [ToDo]


}

class Store: ObjectStore
{
    func allObjects() -> [ToDo] {
        return objectArray
    }

    func count() -> Int {
        return objectArray.count
    }

    func todoAtIndex(index: Int) -> ToDo {
        return objectArray[index]
    }

    func remove(index: Int) {
        objectArray.remove(at: index)
    }

    func add(todo: ToDo) {
        objectArray.append(todo)
    }

    var objectArray = [ToDo]()
    
}

let myNewTodo = ToDo(text: "Make bed")

myNewTodo.text

let myNewStore = Store()

myNewStore.add(todo: myNewTodo)
