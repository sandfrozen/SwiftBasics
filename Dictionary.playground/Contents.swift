//: Playground - noun: a place where people can play

import Cocoa

var dict1: Dictionary<String, Double> = [:]
var dict2 = Dictionary<String,Double>()
var dict3: [String:Double] = [:]
var dict4 = [String:Double]()


var movieRatings = ["Donnie Darko": 4, "Chungking Express": 5, "Mroczne miasto": 4]
print("Oceniłem \(movieRatings.count) filmy")
let darkoRating = movieRatings["Donnie Darko"]

// UPDATING
movieRatings["Mroczne miasto"] = 5
movieRatings

let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
    print("Poprzednia ocena: \(lastRating), aktualna ocena: \(currentRating)")
}

// ADDING
movieRatings["Split"] = 4
movieRatings

movieRatings.removeValue(forKey: "Mroczne miasto")
movieRatings
movieRatings["Split"] = nil
movieRatings

for (key, value) in movieRatings {
    print("Film \(key) oceniony na \(value)")
}

for movie in movieRatings.keys {
    print("Oceniono film \(movie)")
}

let album = ["Diet Roast Beef": 268,
             "Tomek Tomek": 213 ]

let watchMovies = Array(movieRatings.keys)
watchMovies[0]