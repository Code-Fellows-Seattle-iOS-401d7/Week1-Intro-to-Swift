

/// Class 1 Homework/Lab \\\

import UIKit


/*
 
 1) Write a function that takes in a string, checks if it can be converted to a number, and returns a optional number
 
 2) Write a function that takes in a tuple (Int, Int) and returns the sum of the 2 values as Int
 
 3) Write a function that take in a string, and returns a message: “String contains n characters”
 
 4) Write a function that takes in a string and reverses it. Use a simple for loop
 
 */



// Problem 1 \\

func stringFunc(aString: String) -> Int? {
    return Int(aString)
}
stringFunc(aString: "hello")
stringFunc(aString: "10")



// Problem 2 \\

func tupleTaker(integer1: Int, integer2: Int) -> Int {
    return integer1 + integer2
}
tupleTaker(integer1: 40, integer2: 31)



// Problem 3 \\

func stringTaker(bString: String) -> String {
    //print(bString)
    let chars = bString.characters.count
    //print(chars)
    return "String contains \(chars) characters"
}
stringTaker(bString: "Hello")



// Problem 4 \\

func reverse(theString: String) -> String {
    var stringReversal = ""
    for letter in theString.characters {
        stringReversal.insert(letter, at: stringReversal.startIndex)
    }
    return stringReversal
}
reverse(theString: "reverse")
reverse(theString: "This sentence will be reversed.")









