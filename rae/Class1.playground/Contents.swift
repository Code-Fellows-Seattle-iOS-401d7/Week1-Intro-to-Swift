//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


func checkAndReturn(myString: String) -> Int? {
    print(myString)
    
    return Int(myString)
    
}

let result = checkAndReturn(myString: "abc")



func addTwoInt(number: Int) -> Int {
    let addition = number + number
    return addition
}
addTwoInt(number: 2)

let addTuple: (Int, Int) -> () = {(numberOne, numberTwo) in
    print(numberOne + numberTwo)
}

addTuple(2, 4)

func takeIn(myTuple:(a: Int,b: Int)) -> Int{

}


let myString : String = "\()"
func printStringMsg(myString: String) -> String {
    print("This string has \(myString.characters.count) characters")
}

func reverse(string: String) -> String{
    
    var result = ""
    
    for character in string.characters {
        
        result = String(character) + result
        
        print(character)
    }
    return result
}
reverse(string: "Adam")






















