//: Playground - noun: a place where people can play

import Cocoa

//var groceryBag = Set<String>()
//
//groceryBag.insert("Jabłka")
//groceryBag.insert("Pomarańcze")
//groceryBag.insert("Ananasy")
//groceryBag
//
//for food in groceryBag {
//    print(food)
//}

//var groceryBag = Set(["Jabłka", "Pomarańcze", "Ananasy"])

var groceryBag: Set = ["Jabłka", "Pomarańcze", "Ananasy"]

for food in groceryBag {
    print(food)
}

let hasBananas = groceryBag.contains("Banany")

let friendGroceryBag = Set(["Banany", "Płatki", "Mleko", "Pomarańcze"])

// ZŁĄCZENIE bez powtórzeń
let commonGroceryBag = groceryBag.union(friendGroceryBag)

let roommatesGroceryBag = Set(["Jabłka", "Banany", "Płatki", "Pasta"])

// CZĘŚĆ WSPÓLNA
let itemsToReturn = commonGroceryBag.intersection(roommatesGroceryBag)


let yourSecondBag = Set(["Jagody", "Jogurt"])
let roommatesSecondBag = Set(["Winogrono", "Miód"])

// TE SAME ELEMENTY W ZBIORACH
let disjoint = yourSecondBag.isDisjoint(with: roommatesSecondBag)