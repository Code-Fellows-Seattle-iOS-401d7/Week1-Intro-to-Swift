//: Playground - noun: a place where people can play

import UIKit

// Write a function that takes in an array of planet names as strings, checks if array contains “Earth”. If it does not, add it. Otherwise, do nothing.

var planetArray = ["Mercury", "Venus", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]

func checkForEarth(arrayOfPlanets: [String]) -> [String] {
    
    var usableArray = arrayOfPlanets
    
    if !arrayOfPlanets.contains(where: {$0 == "Earth"}) {
        usableArray.append("Earth")
    }
    
    return usableArray

}

checkForEarth(arrayOfPlanets: planetArray)

checkForEarth(arrayOfPlanets: ["Alpha-Centauri", "Betelgeuse"])



//Using sort and reduce, create string from the above array sorted alphabetically. Example Output: [“Venus”, “Earth”] would produce “Earth Venus”

func sortAndReduce(array: [String]) -> String {
    
    let result = array.sorted().reduce("", {$0 + " " + $1})
    
    return result
}

sortAndReduce(array: planetArray)

sortAndReduce(array: ["Minbar", "Alpha-Centauri", "Betelgeuse"])



//Declare a dictionary of string keys and values. Declare a function that takes in a string and searches dictionary for it as a value.

let dictionaryOfPlanetGods = ["Mercury": "God of messengers and travel", "Venus": "Goddess of love and beauty", "Earth": "What is says on the label", "Mars": "God of war", "Jupiter": "God of thunder; Ruler of the gods", "Saturn": "God of agriculture", "Uranus": "Father of the gods", "Neptune": "God of the sea"]

func whichGod(name: String) -> String {
    
    let name = name.capitalized
    var result = ""
    
    if dictionaryOfPlanetGods[name] != nil {
        result = dictionaryOfPlanetGods[name]!
    } else {
        result = "Not found."
    }
    
    return result
}

whichGod(name: "Jupiter")
whichGod(name: "mercury")
whichGod(name: "Bill")



//Write a function that counts repeating words in an array of strings, and prints out the count of each

let arrayOfStrings = ["Chase", "chase", "mice", "run", "in", "circles", "yet", "mark", "territory", "sleep", "on", "keyboard", "claw", "drapes", "intently", "sniff", "hand", "burrow", "under", "covers", "for", "behind", "the", "couch", "but", "inspect", "anything", "brought", "into", "the", "house", "intently", "stare", "at", "the", "same", "spot", "flop", "over", "or", "give", "attitude", "or", "hide", "when", "guests", "come", "over", "yet", "hide", "when", "guests", "come", "over", "mark", "territory"]


func countWords(arrayOfWords: [String]) {
    
    var comparisonSet: Set<String> = []
    var filtered = [String]()
    
    for word in arrayOfWords {
        
        if !comparisonSet.contains(word.lowercased()) {
            comparisonSet.insert(word.lowercased())
            
            filtered = arrayOfWords.filter({$0 == word || $0 == word.lowercased()})
            
            print(word.lowercased(), " - ", filtered.count, "time(s)")
            
        }
    }
}

countWords(arrayOfWords: arrayOfStrings)
