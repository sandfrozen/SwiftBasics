import Cocoa

enum TextAlignment: Int {
    case Left    = 20
    case Right   = 30
    case Center  = 40
    case Justify = 50
}

//var alignment: TextAlignment = TextAlignment.Left
//alignment = .Right

var alignment = TextAlignment.Justify

switch alignment {
case .Left:
    print("Wyrównanie do lewej.")
    
case .Right:
    print("Wyrównanie do prawej")
    
case .Center:
    print("Wyrównanie do środka")
    
case .Justify:
    print("Wyrównanie wyjustowane")
}

print("Left ma wartość pierwotną \(TextAlignment.Left.rawValue)")
print("Right ma wartość pierwotną \(TextAlignment.Right.rawValue)")
print("Center ma wartość pierwotną \(TextAlignment.Center.rawValue)")
print("Justify ma wartość pierwotną \(TextAlignment.Justify.rawValue)")

alignment.hashValue
alignment.rawValue
let ta = TextAlignment(rawValue: 20)


// rawValue to nazwa case
enum ProgrammingLanguage: String {
    case Swift
    case ObjectiveC = "Objective-C"
    case C
    case Cpp        = "C++"
    case Java
}

let myFavoriteLanguage = ProgrammingLanguage.Swift
print("Moim ulubionym językiem programowania jest \(myFavoriteLanguage.rawValue).")


// żarówka
enum Lightbulb {
    case On
    case Off
    
    func surfaceTemperatureToAmbientTemperature(ambient: Double) -> Double {
        switch self {
        case .On:
            return ambient + 150.0
        case .Off:
            return ambient
        }
    }
    
    mutating func toggle() {
        (self == .On) ? (self = .Off) : (self = .On)
//        switch self {
//        case .On:
//            self = .Off
//        case .Off:
//            self = .On
//        }
    }
}

var bulb = Lightbulb.On
let ambientTemperature = 77.0

bulb.toggle()
var bulbTemperature = bulb.surfaceTemperatureToAmbientTemperature(ambient: ambientTemperature)
print("Temperatura żarówki wynosi \(bulbTemperature) stopni.")



enum ShapeDimensions {
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    case Point
    case Triangle(cathetusOne: Double, cathetusTwo: Double, hypotenuse: Double)
    
    func area() -> Double {
        switch self {
        case let .Square(side):
            return side * side
            
        case let .Rectangle(width: w, height: h):
            return w * h

        case .Point:
            return 0
            
        case let .Triangle(cathetusOne: a, cathetusTwo: b, hypotenuse: _):
            return a * b / 2
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case let .Square(side):
            return side * 4
            
        case let .Rectangle(width: w, height: h):
            return w * 2 + h * 2
            
        case .Point:
            return 0
            
        case let .Triangle(cathetusOne: a, cathetusTwo: b, hypotenuse: c):
            return a + b + c
        }
    }
}


var squareShape = ShapeDimensions.Square(10.0)
var rectShape = ShapeDimensions.Rectangle(width: 5.0, height: 10.0)
var pointShape = ShapeDimensions.Point
var traingleShape = ShapeDimensions.Triangle(cathetusOne: 3.0, cathetusTwo: 4.0, hypotenuse: 5.0)

print("Pole kwadratu: \(squareShape.area())")
print("Obwód kwadratu: \(squareShape.perimeter())")
print("Pole prostokąta: \(rectShape.area())")
print("Obwód prostokąta: \(rectShape.perimeter())")
print("Pole punktu: \(pointShape.area())")
print("Obwód punktu: \(pointShape.perimeter())")
print("Pole trójkąta prostokątnego: \(traingleShape.area())")
print("Obwód trójkątka prostokątnego: \(traingleShape.perimeter())")


enum FamilyTree {
    case NoKnownParents
    indirect case OneKnownParent(name: String, ancestors: FamilyTree)
    indirect case TwoKnownParents(farherName: String, fatherAncestors: FamilyTree, motherName: String, motherAncestors: FamilyTree)
}

let fredAncestors = FamilyTree.TwoKnownParents(
    farherName: "Fred Senior",
    fatherAncestors: .OneKnownParent(name: "Beata", ancestors: .NoKnownParents),
    motherName: "Marta",
    motherAncestors: .NoKnownParents
)