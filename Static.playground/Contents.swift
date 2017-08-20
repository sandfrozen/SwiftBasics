//: Playground - noun: a place where people can play

import UIKit

struct Square {
    static func numberOfSides() -> Int {
        return 4
    }
    static let angle:Int = 90
}

Square.numberOfSides()
Square.angle

// Main defference between ENUM / STRUCT and CLASS:
// class can be inherited

class Monster {
    class func makeNoise() -> String {
        return "Huuuaaa..."
    }
    
    class var monsterNoise: String {
        return "Grr.."
    }
    
    static let isHuge = true
}

class Zombie: Monster {
    override class func makeNoise() -> String {
        return "Zoooobieee..."
    }
    
    override class var monsterNoise: String{
        return "Hrr.."
    }
}

Monster.makeNoise()
Zombie.makeNoise()

Monster.monsterNoise
Zombie.monsterNoise

// Main defference between STATAIC PROPERTIES and PROPERTIES OF CLASS: static properties cannot be overwriting

Monster.isHuge
Zombie.isHuge

