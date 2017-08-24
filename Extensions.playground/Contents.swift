//: Playground - noun: a place where people can play

import UIKit

typealias Velocity = Double

extension Velocity {
    var kph: Velocity { return self * 1.60934 }
    var mph: Velocity { return self }
}

protocol VehicleType {
    var topSpeed: Velocity { get }
    var numberOfDoors: Int { get }
    var hasFlatbed: Bool { get }
}

struct Car {
    let make: String
    let model: String
    let year: Int
    let color: String
    let nickname: String
    var gasLevel: Double {
        willSet {
            precondition(newValue >= 0.0 && newValue <= 1.0, "Nowa wartość musi si mieścić w zakrecie od 0 do 1.")
        }
    }
}
// Extension used as ensure compability with Protocol
extension Car: VehicleType {
    var topSpeed: Velocity {
        return 180
    }

    var numberOfDoors: Int {
        return 4
    }

    var hasFlatbed: Bool {
        return false
    }
}

// Extension used for add init method
extension Car {
    init(carMake: String, carModel: String, carYear: Int) {
        self.init(make: carMake, model: carModel, year: carYear, color: "czarny", nickname: "nie dotyczy", gasLevel: 1.0)
    }
}

var car = Car(carMake: "Ford", carModel: "Fusion", carYear: 2013)

// Extension used for add nested type
extension Car {
    enum CarKind: CustomStringConvertible {
        case Coupe, Sedan
        var description: String {
            switch self {
            case .Coupe:
                return "Coupe"
            case .Sedan:
                return "Sedan"
            }
        }
    }
    
    var kind: CarKind {
        if numberOfDoors == 2 {
            return .Coupe
        } else {
            return .Sedan
        }
    }
}

car.kind.description

// Extension used for add mutating functions
extension Car {
    mutating func emptyGas(amonut: Double) {
        precondition(amonut > 0 && amonut <= 1, "Ilość do usunicia musi mieścić się w zakresie od 0 do 1.")
        gasLevel -= amonut
    }
    
    mutating func fillGas() {
        gasLevel = 1.0
    }
}

car.emptyGas(amonut: 0.3)
car.gasLevel

// Extension of simple type
extension Int {
    var timesFive: Int {
        return self * 5
    }
}

5.timesFive