//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


// Week 1, Class 4 Lab 

// Declare Enum that conforms to Error. Your Enum should have at least 5 cases and should use Associated Values. 

enum NoDinner: Error {
    case NoMoney(String)
    case NoFood(String)
    case CantCook(String)
    case UpsetStomach(String)
    case NotHungry(String)
    
}



// Declare a Person class with 3 member properties. Declare a Student subclass that inherits from Person. 
// - Both your Student and Person class should have a variety of meaningful Type and Instance Methods. Be creative. 
// - In either of these 2 classes, demonstrate a computed property and implement a property observer. 

class Person {
    
    var people = [String]()
    
    var age = 25
    
    let name = "Corey"
    
    var description: String {
        return "This person's name is \(name)!"
    }
    
    static let individual = Person()
    
    
}

class Corey: Person {
    
    var origin = Person()
    
    var retirement: Person {
        get {
            let retirementAge = origin.age * 2
            return Person(retirementAge)
        }
        
    }
}










// Create a Classroom class that is a true singleton and has an array of Students. 
// - Add accessor methods to Classroom to add and remove from the array.


class Classroom {
    let shared = Classroom()
    
    var students = ["Corey", "John", "Erica", "Rae"]
}


















