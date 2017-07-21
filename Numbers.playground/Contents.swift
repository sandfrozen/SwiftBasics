//: Playground - noun: a place where people can play

import Cocoa

print("Max int8: \(Int8.max)")
print("Min int8: \(Int8.min)")

print("Max int16: \(Int16.max)")
print("Min int16: \(Int16.min)")

print("Max int32: \(Int32.max)")
print("Min int32: \(Int32.min)")

print("Max int64: \(Int64.max)")
print("Min int64: \(Int64.min)")

print("Max int: \(Int.max)")
print("Min int: \(Int.min)")

print("Max Uint: \(UInt.max)")
print("Min Uint: \(UInt.min)")

let myUint: UInt = 1
var myInt: Int8 = -128

print(10+2*5)
print(30 - 5 - 5)
print(11/3)
print(11%3)
print(-11%3)

var i: Int = 1
i+=1
i-=2

let y: Int8 = 120
let z = Int16(y) &+ 9

let d1 = 1.1
let d2:Double = 1.2
let f1:Float = 1023.23
print(12.4 / 5.0)

if d1 == d2 {
    print("d1 i d2 sa takie same")
}

if d1+0.1 == d2 {
    print("d1 i d2 sa takie same")
}