//: Playground - noun: a place where people can play

import UIKit

// Declare Enum that conforms to Error. Your enum should have at least 5 cases and should use Associated Values.

enum LateForClass: Error {

    case alarmMalfunction(Int, Int)
    
    case weather(String)
    
    case carTrouble(String)
    
    case busTrouble(Int)
    
    case alienInvasion(String)
    
}

let excuse = LateForClass.busTrouble(5)

switch excuse {
case .alarmMalfunction(let alarmWentOff, let supposedToGoOff):
    print("My alarm went off at \(alarmWentOff) instead of at \(supposedToGoOff)!")
case .weather(let weatherType):
    print("Sorry, the \(weatherType) was really bad at my house.")
case .carTrouble(let automotiveIssue):
    print("My car has \(automotiveIssue)--I couldn't get to class.")
case .busTrouble(let busNumber):
    print("The #\(busNumber) bus was running really late!")
case .alienInvasion(let ridiculousAssertion):
    print("Aliens are invading Earth! I had to \(ridiculousAssertion) before I could get to class.")
}



// Declare a Person class with 3 member properties. Declare a Student subclass that inherits from Person.
// Both Your Student and Person class should have a variety of meaningful Type and Instance Methods. Be creative.
// In either of these 2 classes, demonstrate a computed property and implement a property observer.

class Person {
    
    static var couldLiveOnAnotherPlanet: Bool = false
    static var humanPlanets: [String] = ["Earth"]
    
    let firstName: String
    var lastName: String {
        didSet {
            print("Last name successfully changed to \(lastName).")
        }
    }
    var age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    func hadABirthday() {
        self.age += 1
    }
    
    func changeLastName(newLastName: String) {
        lastName = newLastName
    }
    
    class func colonized(planet: String) {
        humanPlanets.append(planet)
        if humanPlanets.count > 1 {
            couldLiveOnAnotherPlanet = true
        }
    }
}

class Student : Person {
    
    var currentClass: String
    var studentID: String
    
    var assignmentGrades: [Double] {
        didSet {
            updateClassGrades()
            print("Updating class grade to include newest grade.")
        }
    }
    
    var currentGradePercent: Double
    
    init(currentClass: String,
         studentID: String,
         assignmentGrades: [Double],
         currentGradePercent: Double = 100.00,
         firstName: String,
         lastName: String,
         age: Int) {
        
        self.currentClass = currentClass
        self.studentID = studentID
        self.assignmentGrades = assignmentGrades
        self.currentGradePercent = currentGradePercent
        
        super.init(firstName: firstName, lastName: lastName, age: age)
    }
    
    var sumOfGradeScores: Double {
        return assignmentGrades.reduce(0.0, {$0 + $1})
    }
    
    func calcGradePercent() -> Double {
        currentGradePercent = sumOfGradeScores / Double(assignmentGrades.count)
        return currentGradePercent
    }
    
    func addAssignmentGrade(newGrade: Double) {
        assignmentGrades.append(newGrade)
    }
    
    func updateClassGrades() {
        if !assignmentGrades.isEmpty {
            calcGradePercent()
        } else {
            print("No grades have been recorded.")
        }
    }
    
}

var me = Person(firstName: "Erica", lastName: "Winberry", age: 40)

var alsoMe = Student(currentClass: "iOS 401", studentID: "feh", assignmentGrades: [90.0, 89.0, 50.0], firstName: "Erica", lastName: "Winberry", age: 40)

var randomStudent = Student(currentClass: "none", studentID: "rando", assignmentGrades: [90.0, 45.0], firstName: "Rando", lastName: "McRandom", age: 34)

alsoMe.addAssignmentGrade(newGrade: 89.0)
alsoMe.updateClassGrades()
alsoMe.currentGradePercent




// Create a Classroom class that is a true singleton and has an array of Students.
// Add accessor methods to Classroom to add and remove from the array.

class Classroom {
    
    private var studentList = [Student]()
    
    static let shared = Classroom()
    
    private init() {}
    
    func addStudent(newStudent: Student) {
        studentList.append(newStudent)
    }
    
    func removeStudent(studentID: String) {
        for (index, student) in studentList.enumerated() {
            if studentID == student.studentID {
                print("Removing \(student.firstName) at index \(index)")
                studentList.remove(at: index)
            }
        }
    }
    
    func listStudents() {
        for student in studentList {
            print(student.firstName, student.lastName)
        }
    }
}

Classroom.shared.addStudent(newStudent: alsoMe)
Classroom.shared.addStudent(newStudent: randomStudent)

Classroom.shared.listStudents()

Classroom.shared.removeStudent(studentID: "feh")

Classroom.shared.listStudents()



