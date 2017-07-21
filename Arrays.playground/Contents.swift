//: Playground - noun: a place where people can play

import Cocoa

//var bucketList: Array<String>

//var bucketList: [String] = ["Pojechać na Alaske"]

var bucketList = ["Pojechać na Alaske"]
bucketList.append("Poleciec na Islandię")
bucketList.append("Powrócić do przyszłości")
bucketList.append("Zmienić czas na letni")
bucketList.append("Kupic nowy rower")
bucketList.append("Latać paralotnią")

bucketList.remove(at: 2)
bucketList
print(bucketList.count)

print(bucketList[0...2])
bucketList[2] += " nad ranem."
print(bucketList[2])

bucketList[0] = "Zdobyć Nange"
bucketList

var newItems = [
    "Polecieć balonem na Fidzi",
    "Nurkować na kanarach",
    "Udać się na wędrówkę",
    "Znaleźć potrójna tęczę"
]

bucketList += newItems

bucketList.insert("Przechać sankami przez Alaskę", at: 2)

let lauches = [
    "Cheeseburger",
    "Pizza",
    "Sałatka",
    "Burito",
    "Falafel"
]