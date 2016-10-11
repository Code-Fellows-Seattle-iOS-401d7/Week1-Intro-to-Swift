//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Write a function that takes in a string, checks if it can be converted to a number, and returns a optional number

func toNumber(str: String) -> Int? {
    return Int(str)
}

// Write a function that takes in a tuple (Int, Int) and returns the sum of the 2 values as Int

let twoOperands = (o1:2, o2:4)


func sum(o1: Int, o2: Int) -> Int {
    return o1 + o2
}

sum(o1:twoOperands.o1, o2:twoOperands.o2)


// Write a function that take in a string, and returns a message: “String contains n characters”

func length(str:String) -> Int {
    return str.characters.count
}

// Write a function that takes in a string and reverses it. Use a simple for loop

func reverse(str:String) {
    let originalStr = Array(str.characters)
    var reversedStr = String()

    for index in stride(from: originalStr.count - 1, through: 0, by: -1) {
        reversedStr.append(originalStr[index])
    }
    print(reversedStr)
}

reverse(str:"Filiz")
