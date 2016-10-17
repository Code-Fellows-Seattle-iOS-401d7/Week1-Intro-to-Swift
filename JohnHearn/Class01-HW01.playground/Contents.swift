/* * * * * * * * * * * * *
 * John Hearn            *
 * Code Fellows 401: iOS *
 * October 2016          *
 * * * * * * * * * * * * */

import UIKit

/*
 *  Write a function that takes in a string, checks if it can be converted
 *  to a number, and returns a optional number
 */

func stringToNumber(string: String) -> Any? {
    let double: Double? = Double(string)
    let integer: Int? = Int(string)

    if double != nil {
        return double
    } else {
        return integer
    }
}
stringToNumber(string: "1234")
stringToNumber(string: "1234.456")
stringToNumber(string: "1234.foo")



/*
 *  Write a function that takes in a tuple (Int, Int) and returns the sum
 *  of the 2 values as Int
 */

func sumTuple( tuple: (a: Int, b: Int) ) -> Int {
    return tuple.a + tuple.b
}
sumTuple(tuple: (5,7) )



/*
 *  Write a function that take in a string, and returns a message:
 *  “String contains n characters”
 */

func stringLength(string: String) -> String {
    return "String contains " + String(string.characters.count) + " characters"
}
stringLength(string: "Does this string contains 40 characters?")



/*
 *  Write a function that takes in a string and reverses it. Use a
 *  simple for loop
 */

func reverseString (string: String) -> String {
    var reversed: String = String();

    for character in string.characters {
        reversed = String(character) + reversed
    }

    return reversed
}
reverseString(string: "Able was I ere I saw Elba")







