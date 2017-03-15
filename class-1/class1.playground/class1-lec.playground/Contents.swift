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

func square(number: Int) -> Int {
    return number * number
}

square(number: 100)

let mySquareFunc = square(number: 10)

let addTwoNumber: (Int, Int) -> () = {(numberOne, numberTwo) in
    print("\(numberOne + numberTwo)")
}

addTwoNumber(10, 20)

//optionals
var optionalString : String?

let counter = 1000

if counter < 100 {
    optionalString = "Under 100"
}

print(optionalString)

//unwrapping:

if let optionalString = optionalString {
    //do some stuff with optionalString if it has a value, because it's now unwrapped (and it's a constant now)
    print(optionalString)
}

for num in 1...100 {
    guard let optionalString = optionalString else { break }
    print(num)
}

//functions with optionals

func number(myString: String = "0") -> Int? {
    return Int(myString)
}

number(myString: "Erica")

number(myString: "12")

number()
