//
//  main.swift
//  CyclicalAssets
//
//  Created by Tomek Buslowski on 28.08.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation

var bob: Person? = Person(name: "Bob")
print("Utworzono obiekt: \(bob)")

var laptop: Asset? = Asset(name: "Laptopn", value: 1500.0)
var hat: Asset? = Asset(name: "Czapka", value: 175.0)
var backpack: Asset? = Asset(name: "Plecak", value: 45.0)

bob?.takeOwnerShipOfAssets(asset: laptop!)
bob?.takeOwnerShipOfAssets(asset: hat!)

print("Kiedy obiekt Bob istnieje, właścicielem czpki jest \(hat!.owner).")
bob = nil
print("Zmienna bob ma teraz wartość: \(bob)")
print("Kiedy obiekt Bob nie istnieje, właścicielem czpki jest \(hat!.owner).")

laptop = nil
hat = nil
backpack = nil

