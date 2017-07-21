//: Playground - noun: a place where people can play

import Cocoa

var population: Int = 40000
var message: String

if population < 10000 {
    message = "Populacja wynosi \(population)"
} else if population >= 10000 && population < 50000{
    message = "Populacja jest [10000, 50000]"
} else {
    message = "Populacja >= 50000"
}

print(message)

message = population < 10000 ? "Populacja < 10000" : "Populacja >= 10000"

