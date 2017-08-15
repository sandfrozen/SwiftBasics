//: Playground - noun: a place where people can play

import UIKit

// Enum ---------------------------------------------
enum TextAligment: Int {
    case Left    = 10
    case Center  = 20
    case Right   = 30
    case Justify = 40
}
TextAligment.Left
TextAligment(rawValue: 10)

enum Lightbulb {
    case On
    case Off
    
    mutating func toggle() {
        switch self{
        case .On:
            self = Lightbulb.Off
        case .Off:
            self = Lightbulb.On
        }
    }
}

enum Test: String {
    case Example = "ex"
}

enum Test2 {
    case Example(name: String)
}

enum Shape {
    case Point
    case Square(Double)
    case Rectangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        
        case let .Square(size):
            return size * size
            
        case let .Rectangle(width: w, height: h):
            return w * h
            
        default:
            return 0.0
        }
    }
}

var s = Shape.Square(14.7)
s.area()

var r = Shape.Rectangle(width: 10, height: 5)
r.area()

var p = Shape.Point
p.area()


// Struct ---------------------------------------------
struct Town {
    var population = 5422
    var numberOfHouses = 4
    
    func averagePeopleInHouse() -> Int {
        return population / numberOfHouses
    }
    
    mutating func changePopulation(value: Int) {
        population = value
    }
}

var t = Town()
t.averagePeopleInHouse()
t.changePopulation(value: 1000)
t.averagePeopleInHouse()


// Class ---------------------------------------------
class Clinet {
    var name:String = "Jon"
    var surname:String = "Smith"
    var accountNumber: Int? = nil
    var saldo:Double = 0
    
    func showInfo() {
        if let number = accountNumber {
            print("Client: \(name) \(surname) have account: \(number).")
        } else {
            print("Client: \(name) \(surname) have no account.")
        }
    }
    
    final func payment(money: Double) {
        saldo += money
    }
    
    func pay(amount: Double) {
        if saldo >= amount {
            saldo -= amount
        }
    }
}

var c = Clinet()
c.showInfo()
c.accountNumber = 12
c.showInfo()


class VipClient: Clinet {
    
    init(name: String, surname: String, accountNr: Int, saldo: Double) {
        super.init()
        self.name = name
        self.surname = surname
        self.accountNumber = accountNr
        self.saldo = saldo
    }
    
    override func showInfo() {
        //print("Vip \(super.showInfo())")
        print("Vip", terminator: " ")
        super.showInfo()
    }
    
    override func pay(amount: Double) {
        saldo -= amount
    }
}


c = VipClient(name: "Duke", surname: "Silver", accountNr: 99991234, saldo: 1000)
c.showInfo()

var separated = ""
print(1.0, 2.0, 3.0, 4.0, 5.0, separator: " ... ", terminator: "", to: &separated)
print(separated)

var range = "My range: "
print(1...5, to: &range)
print(range)
print("new line after two lines")
