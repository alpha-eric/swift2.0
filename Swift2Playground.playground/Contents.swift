//: Playground - noun: a place where people can play

import UIKit

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

if let con = Int(possibleNumber) {
    print("\(possibleNumber) has an integer value of \(con)")
} else {
    print("\(possibleNumber) could not be converted to an integer")
}

var str = "Hello, playground"

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(self.numberOfSides)"
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDes = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        self.numberOfSides = 0
        self.name = ""
    }
    
    func simpleDes() -> String {
        return "A shape \(self.name) with \(self.numberOfSides) sides."
    }
}

var namedshape = NamedShape(name: "hello")
namedshape.numberOfSides = 99
namedshape.simpleDes()

class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDes() -> String {
        return "A squre with sides of length \(self.sideLength)"
    }
}

let test = Square(sideLength: 52, name: "my test")
test.area()
test.simpleDes()

let optionalSquare: Square? = nil//Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength


class Circle: NamedShape {
    var radius: Double
    var perimeter: Double {
        get {
            return 3.0 * self.radius
        }
        set {
            self.radius = newValue
        }
    }
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    func area() -> Double {
        return radius * radius
    }
    override func simpleDes() -> String {
        return "A circle with radius \(self.radius)"
    }
}

var circle = Circle(radius: 9.9, name: "Happy Circle")
circle.area()
circle.simpleDes()
circle.perimeter
circle.perimeter = 100
circle.perimeter

let possibleString: String? = "An optional string."
let forceString: String = String(possibleString)
let force2String: String = possibleString!

let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
let index = greeting.startIndex.advancedBy(7)
greeting[index]

func hello(name: String, value: Int) -> Void {
    print("hello, \(name), \(value)")
}
hello("Taipei", value: 99)

var square = 0
gameLoop: while square != 10 {
    square += 1
    switch square {
    case 1...3:
        print("1-3 \(square)")
    case 4...6:
        continue gameLoop
    default:
        print("last \(square)")
        break gameLoop
    }
}

var array:[String] = ["AA", "BB"]
var empty:[Int] = []
var empty0 = Array<String>()

var value = Dictionary<Int, String>()
var empty1:[String:String] = [:]

repeat {
    
} while array.count >= 0