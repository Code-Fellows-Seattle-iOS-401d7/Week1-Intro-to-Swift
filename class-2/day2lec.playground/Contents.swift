//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// Lecture, Day 2

// Arrays

var array = [1,2,3,4,5,0]

var count = array.count

if !array.isEmpty {
    
    //do some stuff if array is not empty

}

let first = array.first
let last = array.last

//let newArray = array[3...5]

//let anotherNewArray = array[array.first!...3]

let max = array.max()
let min = array.min()


array.insert(100, at: 2)

array.remove(at: 2)


var names = ["Adam", "Felix", "Kershaw", "Cruz"]

names.sort()


var namesSorted = ["Felix", "Kershaw", "Cruz"].sorted()

names

for (index, name) in names.enumerated() {
    
    print(index, name)

}


let greetingArray = names.map({"Hi \($0)"})

greetingArray


let filteredArray = names.filter({$0 != "Adam"})

filteredArray


let chainedArray = names.filter({$0 != "Adam"}).map({"Hi \($0)"})

chainedArray


// Dictionaries


var person = ["firstName": "Erica", "lastName": "Winberry", "favoriteLang": "Swift"]

person.count


for (key, value) in person {
    print(key, value)
}

for key in person.keys {
    print(key)
}

for value in person.values {
    print(value)
}

//Or can use underscore for placeholder in tuple

for (_, value) in person {
    print("Key:", value)
}

//casting to an array

let castFromDict = Array(person.keys)


// Hash Values

for value in person.values {
    print(value.hash)
}

let erica = "Erica"

erica.hash

//Sets


let setA : Set = [1,2,6,7,8,9]
let setB : Set = [0,1,2,3,4,5]

let unionSet = setA.union(setB)

let intersection = setA.intersection(setB)

let subtract = setA.subtracting(setB)

let symmetric = setA.symmetricDifference(setB)

setA.max()
setA.min()











