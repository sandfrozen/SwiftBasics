//: Playground - noun: a place where people can play

import UIKit

/*
 
 public
 internal - default
 private
 
 */

class Monster {
    class var makeNoise: String {
        return "Mrrr..."
    }
}


class Zombie: Monster {
    override class var makeNoise: String {
        return "Zrrr..."
    }
    
    // internal Getter, private Setter
    private(set) var isFallingApart = false
    
}

var z = Zombie()
z.isFallingApart