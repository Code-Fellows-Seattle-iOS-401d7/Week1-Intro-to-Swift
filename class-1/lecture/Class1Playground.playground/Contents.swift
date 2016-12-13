
/// Strings, variables, data types (tuple, Int, Float), decision making,

import UIKit

var str = "Hello, playground"

print(str)
str

let time: TimeInterval = 1.0

var name: String = "Jake"
name = "Michael"

let num: Int = 10

let string: String = String(num) // "stringify" num

let float: Float = Float(num)

// tuple
// 2 data types stored into one data type
let myTuple: (description: String, code: Int) = (description: "Not Found", code: 404)
// "signature" or "type" of myTuple is String, Int
myTuple.description
myTuple.code



// decison making

let planet = "Mars"

if planet == "Mars" {
    print("Equal")
} else {
    print("Not Equal")
}

let equal = planet == "Earth" ? true : false

//ranges

let closedRange = 0...5 // 0, 1, 2, 3, 4, 5

let halfOpenRange = 0..<5 // 0, 1, 2, 3, 4


// switches

let age = 1

switch age {
case 0...3:
    print("toddler")
case 4...12:
    print("trouble")
case 13..<18:
    print("teenager")
case 18, 21, 30:
    print("real bad")
default:
    print("This wasn't what I expected")
}


// loops
//  for-in loops are most common
//  iterate through a range

// while loops
//  iterate only whne a certain condition is true

// repeat-while
//  will always execute at least once
//  condition evaluate at the end of statement, rather than beginning

//      break and continue keywords for leaving/staying in a loop


let number = [0, 1, 2, 3, 4, 5]

for n in number {
    print(n)
}


for n in stride(from: 0, to: number.count, by: 1) {
    print(n)
}

/// while loop


var count = 0

while count < 10 {
    count += 1
}

repeat {
    print(count)
    count += 1
} while count < 10


//functions and closures
//  functions
//      simply another data type

func squareNumber(number: Int) {
    print(number * number)
}
squareNumber(number: 100)

let mySquareFunc = squareNumber


////Closures
//      ability to "close over" scope within curlies
//      most times closures will return void


/*
 
 var closure: (Int, Int) -> Int
 
 closure = {(a, b) -> Int in
    return a * b
 }
 
 
 */


let addTwoNumbers: (Int, Int) -> () = {(n1, n2) in
    print(n1 + n2)
}

addTwoNumbers(100, 200)


/////Optionals
//      represent a value or the asbence of a value
//      force-unwrap optionals to continue or force the app to crash
//         if let binding
//          
//      guard
//


var optionalString: String?

let counting = 101

if count < 100 {
    optionalString = "Under One hundo"
}

print(optionalString)

//unwrap optionalString
// if does have value, treat optionalString as if no longer an optional
if let optionalString = optionalString {
    print(optionalString)
}


for nn in 0...100 {
    guard let optionalString = optionalString else { break }
    print(nn)
}


// optionals in functions


func numm(aString: String = "0") -> Int? {
    
    return Int(aString)
}

let result = numm()








