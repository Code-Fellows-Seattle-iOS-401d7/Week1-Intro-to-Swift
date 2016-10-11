//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*

Write a function that takes in an array of planet names as strings, checks if array contains “Earth”. If it does 
not, add it. Otherwise, do nothing.

*/

var planetNames = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]


func containsEarth(planets: [String]) -> Bool {
    return planets.filter{ $0 == "Earth" }.first != nil ? true : false
}

func containsEarth2(planets: [String]) -> Bool {
    return planets.contains{ $0 == "Earth" }
}

if !containsEarth(planets: planetNames) {
    planetNames.append("Earth")
}


/*

Using sort and reduce, create string from the above array sorted alphabetically. Example Output: [“Venus”, “Earth”]
would produce “Earth Venus”

*/

func sortReduce(planets: [String]) {
    let sortedReduced = planets.sorted().reduce("", { x, y in x + y } )

    print(sortedReduced)

}

sortReduce(planets: planetNames)


/*

Declare a dictionary of string keys and values. Declare a function that takes in a string and searches dictionary
for it as a value.

*/


var dict = ["firstName" : "Filiz", "lastName" : "Kurban"]

func contains(dict: [String:String], value: String) -> Bool {
    for (key, _) in dict {
        if dict[key] == "Kurban" {
            return true
        }
    }
    return false
}

func contains2(dict: [String:String], value: String) -> Bool {
    return dict.filter{ $0.value == value }.first != nil ? true : false
}

func contains3(dict: [String:String], value: String) -> Bool {
    return dict.contains { $0.value == value }
}

func contains4(dict: [String:String], value: String) -> Bool {
    return dict.contains { element -> Bool in
        if element.value == value {
            return true
        } else {
            return false
        }
    }
}


contains(dict: dict, value: "Kurban")



//Write a function that counts repeating words in an array of strings, and prints out the count of each

var sentence = ["the", "little", "fox", "jumped" , "over", "the", "big", "fox"]

func printRepeating(sentence: [String]) {
    var wordsDict = [String : Int]() // [word : occurence]

    for eachWord in sentence {
        if wordsDict[eachWord] != nil {
            wordsDict[eachWord] = wordsDict[eachWord]! + 1
        } else {
            wordsDict[eachWord] = 1
        }
    }

    for (key,value) in wordsDict {
        if value > 1 {
            print ("Repeating word: \(key). Repeated \(value) times.")
        }
    }
}

printRepeating(sentence: sentence)





