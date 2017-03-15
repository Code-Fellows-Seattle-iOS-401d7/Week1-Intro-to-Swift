//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

print(str)

let name : String = "Erica"


//Type Conversion example

let number: Int = 10

//This doesn't work: let string: String = number

//this does (string literal conversion)

let string: String = "\(number)"

//or

let float : Float = Float(number)

//Tuples

let myTuple : (description: String, code: Int) = (description: "Not Found", code: 404)

myTuple.description
myTuple.code

let planet = "Mars"

if planet == "Mars" {
    print("Equal")
} else {
    print("Not Equal")
}

//Ternary operator:

let equal = planet == "Earth" ? true : false

//let otherEqual = planet == "Earth" ? print("Equal") : print("Not Equal")

let age = 30

switch age {
case 0...3:
    print("Wee bairn")
case 4...12:
    print("trouble")
case 13..<18:
    print("teen")
case 18, 21, 30:
    ("uh oh...")
default:
    print("Something went wrong...")
}

let numbers = [0,1,2,3,4,5]

for number in numbers {
    print(number)
}

for number in stride(from: 0, to: numbers.count, by: 1) {
    print(number)
}

for number in stride(from: 0, through: (numbers.count - 1), by: 2) {
    print(number)
}

var count = 0

while count < 10 {
    print(count)
    count += 1
}

repeat {
    print(count)
    count += 2
} while count < 10

//functions

func square(number: Int) {
    print(number * number)
}

square(number: 100)




