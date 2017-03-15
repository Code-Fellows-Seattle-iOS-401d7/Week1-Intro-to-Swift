//: Playground - noun: a place where people can play

import UIKit

//Write a function that takes in a string, checks if it can be converted to a number, and returns a optional number

func stringToNumber(stringToChange: String) -> Int? {
    
    return Int(stringToChange)
    
}

stringToNumber(stringToChange: "three")

stringToNumber(stringToChange: "3")


//Write a function that takes in a tuple (Int, Int) and returns the sum of the 2 values as Int

func addTupleOfNumbers(myTuple: (Int, Int)) -> Int {
    
    return myTuple.0 + myTuple.1
    
}

addTupleOfNumbers(myTuple: (1, 2))

addTupleOfNumbers(myTuple: (0, -13))


//Write a function that take in a string, and returns a message: “String contains n characters”

func lengthOfString(stringToCount: String) -> String {
    
    return "String contains \(stringToCount.characters.count) characters"

}

lengthOfString(stringToCount: "This is a string.")

lengthOfString(stringToCount: "This is another string. Yay.")


//Write a function that takes in a string and reverses it. Use a simple for loop

func reverseString(stringToReverse: String) -> String {
    
    var result = ""
    
    for index in stringToReverse.characters.indices.reversed() {
        result.append(stringToReverse[index])
    }
    
    return result
}

reverseString(stringToReverse: "Reverse me!")

//Class example for this

func reverse(string: String) -> String {
    
    var result = ""
    
    for character in string.characters {
        result = String(character) + result
    }
    
    return result
    
}

reverse(string: "Reverse me, too!")

