import UIKit
/*
 * Krish Bhavnani
 * App 1
 * 62205424
 * I am really looking forward to gain a stronger understanding of how the apps on our phones are built and go through the app development lifecycle. I have never app of my own but I have completed a pitch deck for an app I had thought of last year in a Tech Entrepreneurship class so I'm excited to possibly bring that idea to fruition after completing this class.
 */

// Exercise 1
let foo : Int = 42
var fooStr : String? = String(foo)

print("My number is \(fooStr!)")

if let fooString = fooStr {
    print("My number is \(fooString)")
}

var num = fooStr ?? "0"
print("My number is \(num)")

//Exercise 2
var arr : [Character] = ["c","i","s","1","9","5"," ","i","s"," ","f","u","n"]
var cis : String = ""
for c in arr {
    cis.append(c);
}
cis.append("!")
print(cis)

var peopleDict : [String : Int] = ["John" : 21, "Andrew" : 20, "Will" : 21]
dump(peopleDict)
var myInfo : (String, Int) = ("Krish", 2022)
print(myInfo)


//Exercise 3

for (person, age) in peopleDict {
    if (age < 21){
        print("My friend \(person) is under 21")
    } else {
        print("My friend \(person) is not under 21")
    }
}

for i in 1...10 {
    print(i)
}

for c in "cis195" {
    print(c)
}

//Exercise 4
func sumAndDiff(_ x : Int,_ y : Int) -> (Int, Int) {
    return (x+y, x-y)
}
print(sumAndDiff(3,4))
typealias Course = String
typealias PennId = Int
func enroll(in course : Course, using pennId : PennId) {
    print("Enrolled \(pennId) in \(course)")
}
let newCourse = "CIS 195"
let myPennId = 62205424
enroll(in : newCourse, using : myPennId)


//Exercises 5 and 6
struct Rectangle {
    var length : Int
    var width : Int
    var area : Int {
        get {
            return length * width
        }
    }
    var description : String? {
        didSet {
            if let desc = description {
                print(desc)
            }
        }
    }
}
var myRect = Rectangle(length : 5, width : 10)

typealias School = String
enum Major {
    case undeclared
    case CIS
    case English
    case Math
}
class Student {
    var name : String
    var school : School?
    var major : Major = Major.undeclared
    
    init(n : String, edu : School, m : Major) {
        name = n
        school = edu
        major = m
    }
    
    init(n : String) {
        name = n
    }
}

var me = Student(n : "Krish", edu : "UPenn", m : Major.CIS)
var babyQuaker = Student(n : "Krish")
var majors : [Major] = [Major.undeclared, Major.CIS, Major.English, Major.Math]
babyQuaker.major = majors.randomElement()!

myRect.description = "This is my rectangle."
print(myRect.area)



