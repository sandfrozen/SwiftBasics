//: Playground - noun: a place where people can play

import UIKit

struct Town {
    
    var population = 5422 {
        willSet {
            print("Wielkosc populaci zostanie zmieniona z \(population) na \(newValue)")
        }
        
        didSet(oldPopulation) {
            print("Wielkość populacji zmieniła się z \(oldPopulation) na \(population)")
        }
    }
}


var t = Town()
t.population = 10

/*
 public
 internal
 private
 */