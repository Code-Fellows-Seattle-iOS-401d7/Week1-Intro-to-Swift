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
    case MultipleResultsFound (name1: String, name2: String)
    case DuplicateEntry (id: String)
    case NotFound
    case UnderAge (minimumAge: Int)
    case InvalidID (id: String)
    case InsufficientFunds (tuition: Int, availableFunds: Int)
}


class Person {
    var ssn: String
    var name: (last: String, first: String, middle: String?)
    var fullName: String {
        if self.name.middle != nil {
            return self.name.first + " " + self.name.middle! + " " + self.name.last
        } else {
            return self.name.first + " " + self.name.last
        }
    }
    var dateOfBirth: Date?

    init(first: String, last: String, middle: String?, year: Int, month: Int, day: Int, ssn: String ){
        self.name = (last, first, middle)
        self.dateOfBirth = DateComponents(calendar: Calendar.gregorian, year: year, month: month, day: day).date
        self.ssn = ssn
    }

}

class Student: Person {
    var id: String{
        return String(self.ssn.hash)
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
    var currentlyEnrolled: Bool
    var age: Int {
        return Int( (Date().timeIntervalSince( self.dateOfBirth! )) / 31_557_600 )
    }

    init(first: String, last: String, middle: String?=nil, year: Int, month: Int, day: Int, ssn: String, funds: Int) {
        self.funds = funds
        self.currentlyEnrolled = false
        super.init(first: first, last: last, middle: middle, year: year, month: month, day: day, ssn: ssn)
    }

    func refundTuition() -> String {
        let refundAmount = self.previousFunds! - self.funds
        self.funds = self.previousFunds!
        return "$\(refundAmount) should be paid to \(self.fullName)"
    }
}

class Classroom {
    private var roster: [Student] = []
    let minimumAge = 12
    let tuition = 10000
    static let shared = Classroom()
    private init() {}

    func enroll(student: Student) throws{
        if student.age < minimumAge {
            throw StudentError.UnderAge(minimumAge: minimumAge)
        } else if student.funds < tuition {
            throw StudentError.InsufficientFunds(tuition: tuition, availableFunds: student.funds )
        } else {
            var found: Student?
            do{
                try found = self.findBy(id: student.id)
                if found != nil {
                    throw StudentError.DuplicateEntry(id: student.id)
                }
            } catch let error {
                print("There was an error: \(error)")

            }
        }
        student.funds -= tuition
        self.roster.append(student)
        student.currentlyEnrolled = true

    }

    func getRoster() -> [Student] {
        return self.roster
    }

    func headCount() -> Int {
        return self.roster.count
    }

    func findBy(id: String?=nil, name: (first: String, last: String)?=nil) throws -> Student?{
        var found: [Student] = []

        if id != nil {
            found = roster.filter({ $0.id == id! })
            if found.count == 0 {
                return nil
            } else if found.count == 1 {
                return found[0]
            } else {
                throw StudentError.DuplicateEntry(id: id!)
            }
        }
        if name != nil {
            found = roster.filter({$0.name.first == name!.first && $0.name.last == name!.last})

            if found.count == 0 {
                return nil
            } else if found.count == 1 {
                return found[0]
            } else {
                throw StudentError.MultipleResultsFound(name1: found[0].fullName, name2: found[1].fullName )
            }

        }
        return nil
    }

    func drop(id: String) {
        var studentToDrop: Student?
        var indexToDrop: Int?
        do{
            try studentToDrop = self.findBy(id: id)
            if studentToDrop != nil {
                // This sucks. I'm searching the roster twice in a row for the same student.
                for ii in 1..<roster.count {
                    if roster[ii] === studentToDrop {
                        indexToDrop = ii
                    }
                }
                if indexToDrop != nil {
                    roster.remove(at: indexToDrop!)
                }
            } else {

                throw StudentError.NotFound
            }
        } catch let error {
            print("Unable to drop student with id: \(id): \(error)")
        }

    }

}


//var person = Person(first: "Joe", last: "Mama", middle: "D", year: 1992, month: 10, day: 10, ssn: "234-56-7890")
var joe = Student(first: "Joe", last: "Mama", year: 1992, month: 10, day: 10,
                  ssn: "234-56-7890", funds: 100)

var richie = Student(first: "Richie", last: "Rich", year: 1999, month: 12, day: 25,
                     ssn: "500-50-5000", funds: 1000000)
var brook = Student(first: "Brooke", last: "Riggio", middle: "Bassage-Glock", year: 1979,
                    month: 6, day: 10, ssn: "123-45-6789", funds: 30000)
var al = Student(first: "Alfred", last: "Bradbury", year: 2010, month: 1, day: 1,
                 ssn: "100-10-10000", funds: 10005)
var emmy = Student(first: "Emily", last: "Dickenson", middle: "Elizabeth", year: 1830,
                   month: 12, day: 10, ssn: "999-00-9999", funds: 10000000)
var steve = Student(first: "Steven", last: "Jobs", middle: "Paul", year: 1955,
                    month: 2, day: 23, ssn: "499-13-1337", funds: 100)


let kids = [joe, richie, brook, al, emmy, steve]

for kid in kids {
    do{
        try Classroom.shared.enroll(student: kid)
    } catch let error {
        print("Unable to enroll \(kid.fullName): \(error)")
    }
}

Classroom.shared.headCount()
Classroom.shared.getRoster()
Classroom.shared.drop(id: emmy.id)
Classroom.shared.headCount()
Classroom.shared.getRoster()
Classroom.shared.drop(id: steve.id)







