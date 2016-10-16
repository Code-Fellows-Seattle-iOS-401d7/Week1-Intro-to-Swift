//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)



var planets = ["Mercury", "Venus", "Mars", "Jupiter", "Uranus", "Neptune", "Pluto"]
if planets.contains("Earth") {
    
} else {
    planets.insert("Earth", at: 2)
}

var sortedPlanets = planets.sorted()

var arrayString : String = sortedPlanets.reduce("", {$0 + "," + $1})
print(arrayString)

let restaurant = ["name":"Subway", "food":"Sandwiches", "quality":"terrible"]

var restaurantString = "Subway"

for value in restaurant.values {
    if value == restaurantString {
        print("This dictionary contains\(restaurantString)")
    }
}

let animals = ["dog", "dog", "dog", "cat", "mouse", "rabbit"]
var repeatedWords: [String:Int] = [:]

for item in animals {
    repeatedWords[item] = (repeatedWords[item] ?? 0) + 1
}
print(repeatedWords)

for (key, value) in repeatedWords {
    print("\(key) comes up \(value) time(s)")
}




