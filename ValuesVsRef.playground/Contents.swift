//: Playground - noun: a place where people can play

import UIKit

// Typ/Semantyka wartości (struct) - Values

var str = "Hello, playground"
var playgroundGreeting = str

// Simple Types like: Int, String, Array, Dictionary etc pass the value not reference:

playgroundGreeting = "New Greeting"
str




// Typ/Semantyka odwołania (class) - Refs

class GreekGod {
    var name: String
    init(name: String) {
        self.name = name
    }
}

// Classes pass the reference to object

let hecate = GreekGod(name: "Hekate")
let anotherHecate = hecate
anotherHecate.name = "InnaHekate"
hecate.name


struct Pantheon {
    let chiefGod: GreekGod
    let dateCreated = NSDate()
}


let pantheon = Pantheon(chiefGod: hecate)
let zeus = GreekGod(name: "Zeus")
// We cannot change properties in 'let stucture...' even properties is declared as 'var...'
//pantheon.chiefGod = zeus

zeus.name = "Zeus Jr."
zeus.name

// Be careful when you use Ref Type in Value Type (Class in Structure)
pantheon.chiefGod.name
let greekPantheon = pantheon
hecate.name = "Triwium"
pantheon.chiefGod.name
greekPantheon.chiefGod.name

greekPantheon.dateCreated



let athena = GreekGod(name: "Athena")
let gods = [athena, hecate, zeus]

let godsCopy = gods
gods.last?.name = "Jowisz"

// In swift there is only Shallow Copy, NO Deep Copy
gods
godsCopy