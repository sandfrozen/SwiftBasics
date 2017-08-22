//: Playground - noun: a place where people can play

import UIKit

// Equality ==, The same value. Simple Types like: String, Int, Float, Double, Array, Dictionary

let x = 1
let y = 1
x == y


// Identity ===, The same place in memory.

class House {
    let address: String
    
    init(address: String) {
        self.address = address
    }
}

let tomHouse = House(address: "Monte Bianco")
let patHouse = House(address: "Warsaw")

tomHouse === patHouse

let cubHouse = tomHouse

tomHouse === cubHouse