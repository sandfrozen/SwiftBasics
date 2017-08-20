//: Playground - noun: a place where people can play

import UIKit

class Food {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let pasta = Food(name: "Pasta")
pasta.name

let noodle = Food()
noodle.name

class Breakfast: Food {
    var time: Int
    
    init(name: String, time: Int) {
        self.time = time
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, time: 1)
    }
}

let sandwich = Breakfast(name: "sandwich", time: 8)
sandwich.name
