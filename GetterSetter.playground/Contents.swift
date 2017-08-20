//: Playground - noun: a place where people can play

import UIKit

struct Town {
    var population = 5422
    var name: String = "Monte Bianco"
}


class Monster {
    
    var town: Town?
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    var victimName: String {
        get {
            return town?.name ?? "[Unknown]"
        }
        set {
            town?.name = newValue
        }
    }
}

var m = Monster()
m.victimPool = 500
m.victimPool

m.victimName
m.victimName = "Jan"