/* * * * * * * * * * * * *
 * John Hearn            *
 * Code Fellows 401: iOS *
 * October 2016          *
 * * * * * * * * * * * * */

import UIKit

/*
 *  Write a function that takes in an array of planet names as strings,
 *  checks if array contains “Earth”. If it does not, add it. Otherwise,
 *  do nothing.
 */

var somePlanets: [String] = [ "Mercury", "Venus", "Mars", "Jupiter",
                           "Saturn", "Uranus", "Neptune"]

var everyPlanet: [String] = [ "Mercury", "Venus", "Earth", "Mars", "Jupiter",
                           "Saturn", "Uranus", "Pluto", "Neptune" ]

func findEarth(planets: [String]) -> [String] {
    // planets is immutable, so are we really going to pass arrays by value?

    var hasEarth: Bool = false

    for planet in planets {
        if planet == "Earth" {
            hasEarth = true
        }
    }

    var finalPlanets: [String] = planets

    if !hasEarth {
        finalPlanets.append("Earth")
    }

    return finalPlanets
}

findEarth(planets: somePlanets)
findEarth(planets: everyPlanet)




/*
 *  Using sort and reduce, create string from the above array sorted
 *  alphabetically. Example Output: [“Venus”, “Earth”] would produce
 *  “Earth Venus”
 */

let alphabetical: (String, String) -> Bool = { s1,s2 in s1<s2 }
let combine: (String, String) -> String = { s1,s2 in  s1+" "+s2 }
everyPlanet.sorted( by: alphabetical ).reduce( "", combine )


/*
 *  Declare a dictionary of string keys and values. Declare a function
 *  that takes in a string and searches dictionary for it as a value.
 */


let rank: [Int : String] = [ 1: "first",   2: "second",    3: "third",
                             4: "fourth",  5: "fifth",     6: "sixth",
                             7: "seventh", 8: "eighth",    9: "ninth:",
                            10: "tenth",  11: "eleventh", 12: "twelfth" ]

func loadDictionary(terms: [String]) -> [String:String] {
    var dictionary = [String:String]()
    var index: Int = 1;
    for term in terms{
        dictionary[term] = rank[index]
        index += 1
    }
    return dictionary
}

let planets = loadDictionary(terms: everyPlanet)

planets["Earth"]



func findPlanetByRank(search: String?, dictionary: [String:String]) -> String{
    var found = [String]()

    for (key, value) in dictionary {
        if value == search {
            found.append(key)
        }
    }

    return found.reduce( "", combine )
}

findPlanetByRank(search: rank[3], dictionary: planets)
findPlanetByRank(search: rank[12], dictionary: planets)
findPlanetByRank(search: rank[15], dictionary: planets)


/*
 *  Write a function that counts repeating words in an array of strings, 
 *  and prints out the count of each
 */

let peterPiper: [String] = [ "peter", "piper", "picked", "a", "peck", "of", "pickled", "peppers",
                            "a", "peck", "of", "pickled", "peppers", "peter", "piper", "picked",
                            "if", "peter", "piper", "picked", "a", "peck", "of", "pickled", "peppers",
                            "where's", "the", "peck", "of", "pickled", "peppers", "peter", "piper", "picked"]

func countStrings(strings: [String]) -> [String:Int]{
    var counts = [String:Int]()

    for string in strings{
        if counts[string] != nil {
            counts[string]! += 1
        } else {
            counts[string] = 1
        }
    }
    return counts
}

countStrings(strings: peterPiper)

func printStringCounts(counts: [String:Int]) -> (){
    for (string, count) in counts {
        print( String(count) + " " + string )
    }
}


printStringCounts( counts: countStrings(strings: peterPiper) )