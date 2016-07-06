//: Playground - noun: a place where people can play

import UIKit

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
