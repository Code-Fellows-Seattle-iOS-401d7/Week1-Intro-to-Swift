//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Declare Identity protocol with id String

protocol Identity
{
    var id: String { get }
}


// Declare a ToDo class that has a text member of type String, and conforms to Identity protocol

class ToDo : Identity {
    
    var id: String
    
    init(id: String) {
        self.id = id
    }
    
}


// Define ObjectStore protocol with these functions: add:, remove:, objectAtIndex:, count, allObjects.

protocol ObjectStore
{
    func add(itemToAdd: ToDo) -> [ToDo]
    
    func remove(itemToRemove: String) -> [ToDo]
    
    func objectAtIndex(index: Int) -> ToDo
    
    func count() -> Int
    
    func allObjects() -> String
}


// Create Store class that will conform to ObjectStore protocol and implement required methods

class Store : ObjectStore {
    
    var listOfItems: [ToDo]
    
    init(listOfItems: [ToDo]) {
        self.listOfItems = listOfItems
    }
    
    func add(itemToAdd: ToDo) -> [ToDo] {
        listOfItems.append(itemToAdd)
        return listOfItems
    }
    
    func remove(itemToRemove: String) -> [ToDo] {
        
        for (index, item) in listOfItems.enumerated() {
            if item.id.lowercased() == itemToRemove.lowercased() {
                listOfItems.remove(at: index)
            }
        }
        return listOfItems
    }
    
    func objectAtIndex(index: Int) -> ToDo {
        return listOfItems[index]
    }
    
    func count() -> Int {
        let result = listOfItems.count
        return result
    }
    
    func allObjects() -> String {
        let result = listOfItems.reduce("Grocery List: ", {$0 + $1.id + ", "} )
        return result
    }
    
}


// Demonstrate adding / removing of ToDo items.

let milk = ToDo(id: "milk")

var groceryList = Store(listOfItems: [milk])

groceryList.listOfItems

groceryList.add(itemToAdd: ToDo(id: "cheese"))
groceryList.add(itemToAdd: ToDo(id: "pickles"))
groceryList.add(itemToAdd: ToDo(id: "kibble"))
groceryList.add(itemToAdd: ToDo(id: "peaches"))

groceryList.remove(itemToRemove: "pickles")
groceryList.remove(itemToRemove: "Milk")


groceryList.objectAtIndex(index: 1)
groceryList.count()
groceryList.allObjects()




