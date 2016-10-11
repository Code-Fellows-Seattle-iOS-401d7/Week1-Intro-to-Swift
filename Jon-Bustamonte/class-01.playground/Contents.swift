//: Playground - noun: a place where people can play

import UIKit

//Write a function that takes in a string, checks if it can be converted to a number, and returns a optional number

func convertStringToNumber(string: String) -> Int? {
    return Int(string)
}

convertStringToNumber(string: "33")


//Write a function that takes in a tuple (Int, Int) and returns the sum of the 2 values as Int

func returnTupleSum(valueOne: Int, valueTwo: Int) -> Int {
    return Int(valueOne + valueTwo)
}

returnTupleSum(valueOne: 3, valueTwo: 58)


//Write a function that take in a string, and returns a message: “String contains n characters”

func stringCharacterCounter(string: String) -> String {
    return "String contains \(string.characters.count) characters"
}

stringCharacterCounter(string: "How many characters are in this string?")



//Write a function that takes in a string and reverses it. Use a simple for loop
//NOTE: Located the reverse() method online and need to use it to create a func

    let str = "Does this reverse a string?"
    let reversed = String(str.characters.reversed())
    print(reversed)