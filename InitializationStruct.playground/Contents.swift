//: Playground - noun: a place where people can play

import UIKit

struct Town {
    let region: String
    var population: Int {
        didSet {
            
        }
    }
    var numberOfStoplights: Int
    
    // Metoda inicjalizacyjna która może zakończyć sie niepowodzeniem
    // bez '?' nie należy zwracać nil
    init?(region: String, population: Int, stoplights: Int) {
        if population <= 0 {
            return nil
        }
        self.region = region
        self.population = population
        self.numberOfStoplights = stoplights
    }
    
    init?(population: Int, stoplights: Int) {
        self.init(region: "[brak danych]", population: population, stoplights: stoplights)
    }
}

// Metoda inicjalizacyjna elementow skladowych
//var myTown = Town(population: 100, numberOfStoplights: 6)
//myTown.numberOfStoplights
//myTown.population

var myTown = Town(region: "zachód", population: 1000, stoplights: 6)

myTown = Town(population: 0, stoplights: 6)
myTown?.region
let ts = myTown?.population


struct WeightRecordInLBS {
    let weight: Double
    
    init(_ pounds: Double) {
        self.weight = pounds
    }
    
    init(weightInKilos kilos: Double) {
        self.weight = kilos * 2.20462
    }
}