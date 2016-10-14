/* * * * * * * * * * * * *
 * John Hearn            *
 * Code Fellows 401: iOS *
 * October 2016          *
 * * * * * * * * * * * * */

/*
 * °  Declare Enum that conforms to Error. Your enum should have at least 5
 *    cases and should use Associated Values.
 * °  Declare a Person class with 3 member properties. Declare a Student
 *    subclass that inherits from Person.
 *    .  Both Your Student and Person class should have a variety of meaningful
 *       Type and Instance Methods. Be creative.
 *    .  In either of these 2 classes, demonstrate a computed property and
 *       implement a property observer.
 * °  Create a Classroom class that is a true singleton and has an array of 
 *    Students.
 *    .  Add accessor methods to Classroom to add and remove from the array.
 */

import UIKit

extension Calendar {
    static var gregorian : Calendar {
        return Calendar(identifier: Calendar.Identifier.gregorian)
    }
}

enum StudentError: Error {
    case StudentNotFound
    case DuplicateEntry (id: String)
    case IneligibleToEnroll
    case InvalidID
    case InsufficientFunds (tuition: Int)
}


class Person {
    var ssn: String
    var name: (last: String, first: String)
    var dateOfBirth: Date?

    init(first: String, last: String, year: Int, month: Int, day: Int, ssn: String ){
        self.name = (last, first)
        self.dateOfBirth = DateComponents(calendar: Calendar.gregorian, year: year, month: month, day: day).date
        self.ssn = ssn
    }
}

class Student: Person {
    var studentID: String{
        return self.ssn + String(self.ssn.hash)
    }
    private var previousFunds: Int?
    var funds: Int {
        willSet(newFunds) {
            self.previousFunds = self.funds
            print("Funds being set: \(self.funds) -> \(newFunds).")

        }
        didSet {
            print("Funds set to \(self.funds)")
        }
    }
    var age: Int {
        return Int( (Date().timeIntervalSince( self.dateOfBirth! )) / 31_557_600 )
    }

    init(first: String, last: String, year: Int, month: Int, day: Int, ssn: String, funds: Int) {
        self.funds = funds
        super.init(first: first, last: last, year: year, month: month, day: day, ssn: ssn)
    }

    func refundTuition() -> String {
        let refundAmount = self.previousFunds! - self.funds
        self.funds = self.previousFunds!

        return "$\(refundAmount) should be paid to \(self.name.first) \(self.name.last)"
    }
}


var person = Person(first: "Joe", last: "Mama", year: 1992, month: 10, day: 10, ssn: "234-56-7890")
var student = Student(first: "Joe", last: "Mama", year: 1992, month: 10, day: 10, ssn: "234-56-7890", funds: 10000)

student.age

student.funds = 100001
student.funds = 0
print( student.refundTuition() )












