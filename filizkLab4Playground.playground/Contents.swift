//: Playground - noun: a place where people can play
//Filiz Kurban Lab 4

import UIKit

/*
Declare Enum that conforms to Error. Your enum should have at least 5 cases and should use Associated Values.
*/
enum accountError: Error {
    case accountNameMismatch(String, String) //Account number, account name
    case accountClosed(String) //Account number
    case accountDoesntExist(String) //Account number
    case accountMarkedForFroud(String) //Account number
    case insufficientFunds(String) //Account number
}

/*
Declare a Person class with 3 member properties. Declare a Student subclass that inherits from Person.
Both Your Student and Person class should have a variety of meaningful Type and Instance Methods. Be creative.
In either of these 2 classes, demonstrate a computed property and implement a property observer.
*/

class Person {
    var firstName: String
    var lastName: String
    var dob: String

    //computed property
    var fullName: String {
        return firstName + " " + lastName
    }

    init(name: String, lastName: String, dob: String) {
        self.firstName = name
        self.lastName = lastName
        self.dob = dob
    }

    func changeName(new: String) {
        self.firstName = new
    }

    func changeDob(new: String) {
        self.dob = new
    }

    func getFullName() -> String {
        return self.fullName
    }

    static func breed() -> String {
        return "Human"
    }
}

class Student: Person {
    let id: String

    //property observer
    var emails = [String]() {
        didSet {
            print("New email count is", emails.count)
        }
    }

    init(id: String, name: String, lastName: String, dob: String) {
        self.id = id
        super.init(name: name, lastName: lastName, dob: dob)
    }

    func setEmail(email: String) {
        emails.append(email)
    }
}

var s = Student(id: "123", name: "Filiz", lastName: "Kurban", dob: "01/01/1990")

s.setEmail(email: "filizk@live.com")
s.changeName(new: "Carry")
assert(s.getFullName() == "Carry Kurban")
s.getFullName()


/*
Create a Classroom class that is a true singleton and has an array of Students.
Add accessor methods to Classroom to add and remove from the array.
*/

class Classroom {

    static private var students = [Student]()

    static let shared = Classroom()

    private init() {}

    static func add(student: Student) {
        Classroom.students.append(student)
    }

    static func remove(index: Int) {
        Classroom.students.remove(at: index)
    }
}

var cr = Classroom.shared

Classroom.add(student: Student(id: "123", name: "Ada", lastName: "Lovelace", dob: "01/01/1900"))





