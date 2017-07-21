//: Playground - noun: a place where people can play

import Cocoa

var j: Int = 0

for i in 1...5 {
    j+=1
}

for _ in 1...5 {
    j+=1
    print(j)
}

for case let i in 1...100 where i % 3 == 0 {
    print(i)
}

var a = 1
while a < 6 {
    print(a)
    if a > 2 {
        break
    }
    a += 1
}