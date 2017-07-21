//: Playground - noun: a place where people can play

import Cocoa

let age = 25
switch age {
case 18...35:
    print("Dorsły")
default:
    break
}

if case 18...35 = age {
    print("Doskonały zakres demograficzny")
}

if case 18...35 = age, age >= 21 {
    print("Doskonały zakres demograficzny i możesz posżywać alkohol")
}