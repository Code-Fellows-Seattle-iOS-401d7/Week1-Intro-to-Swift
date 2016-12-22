//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)

func check(string: String) -> Int? {
    return Int(string)
}


func takeIn(myTuple:(a: Int, b: Int)) -> Int {
    return myTuple.a + myTuple.b
}

var nString = "Thanks Obama"
let charCount = nString.characters.count
print("This string has\(charCount) characters")




func reverse(string: String) -> String {
    
    var result = ""
    
    for character in string.characters {
        result = String(character) + result
        
        print(character)
    }
 return result
}

reverse(string: "Corey")






let status: (code: Int, description: String) = (404, "Not Found")
let errorDescription = status.description


