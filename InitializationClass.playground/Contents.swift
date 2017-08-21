//: Playground - noun: a place where people can play

import UIKit

struct Town {
    var population: Int = 1000
}

var myTown = Town()

class Monster {
    var town: Town?
    var name: String
    
    // Desygnowana metoda inicjalizacyjna - zagwarantowanie przypisania wartości
    required init(town: Town?, monsterName: String) {
        self.town = town
        self.name = monsterName
    }
}

class Zombie: Monster {
    var walksWithLimp: Bool
    private(set) var isFallingApart: Bool
    
    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    // Wygodna metoda inicjalizacyjna - nie gwarantuje, że wszystkie właściwości mają wartość
    convenience init(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("Zombie ma uszkodzone kolano.")
        }
    }
    
    required init(town: Town?, monsterName: String) {
        walksWithLimp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }
    
    deinit {
        print("Zombie \(name) przestaje istnieć.")
    }
}

var myMonster = Monster(town: myTown, monsterName: "Luigi")
var myZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")

myZombie = nil


class MojaKlasa {
    var nazwa: String!
    
    init?(_ nazwa: String) {
        if nazwa.isEmpty {
            self.nazwa = nil
            return nil
        }
        self.nazwa = nazwa
    }
}

var mk = MojaKlasa("")
mk?.nazwa = "a"