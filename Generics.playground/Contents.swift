//: Playground - noun: a place where people can play

import UIKit

struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(newItem: Element){
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
    
    func map<U>(f: (Element) -> U) -> Stack<U> {
        var mappedItems = [U]()
        for item in items {
            mappedItems.append(f(item))
        }
        return Stack<U>(items: mappedItems)
    }
}

var intStack = Stack<Int>()
intStack.push(newItem: 1)
intStack.push(newItem: 2)

var dubledStack = intStack.map(f: {2 * $0})
print(dubledStack.pop())
print(dubledStack.pop())
print(dubledStack.pop())

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

var stringStack = Stack<String>()
stringStack.push(newItem: "first element")
stringStack.push(newItem: "Second elenet")

print(stringStack.pop())
print(stringStack.pop())
print(stringStack.pop())

func myMap<T,U>(items: [T], f: (T) -> (U)) -> [U] {
    var result = [U]()
    for item in items {
        result.append(f(item))
    }
    return result
}

let strings = ["one", "two", "three"]
let stringLengths = myMap(items: strings) { $0.characters.count }
print(stringLengths)



func checkIfEqual<T: Equatable>(first: T, _ second: T) -> Bool {
    return first == second
}

print(checkIfEqual(first: 1, 1))
print(checkIfEqual(first: "tekst", "tekst"))
print(checkIfEqual(first: "tekst", "inny tekst"))

func checkIfDescriptionMatch<T: CustomStringConvertible, U: CustomStringConvertible>(first: T, _ second: U) -> Bool {
    return first.description == second.description
}

print( checkIfDescriptionMatch(first: Int(1), UInt(1)))
print( checkIfDescriptionMatch(first: 1, 1.0) )
print( checkIfDescriptionMatch(first: Float(1.0), Double(1.0)) )


