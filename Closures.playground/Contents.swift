import Cocoa

var volunteerCounts = [1,3,40,32,3,53,77,13]
type(of: volunteerCounts)

func sortAscending(i: Int, j: Int) -> Bool {
    return i<j
}

//let volunteersSorted1 = volunteerCounts.sorted()
//let volunteersSorted2 = volunteerCounts.sorted(by: sortAscending)

//let vlounteersSorted = volunteerCounts.sorted(by: { i, j in i < j })
let volunteersSorted = volunteerCounts.sorted(by: { $0 < $1 })
volunteersSorted

// Funkcja jako typ wartosci zwrotnej
func makeTownGrand() -> (Int, Int) -> Int {
    func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
        return toLights + lightsToAdd
    }
    return buildRoads
}

var stopLights = 4
let townPlan = makeTownGrand()
stopLights = townPlan(4, stopLights)
print("Miasto ma \(stopLights) skrzyżowań ze światłami.")


// Funkcja jako argument funkcji
func makeTownGrandSec(budget: Int, condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
    if condition(budget) {
        func buildRoads(lightsToAdd: Int, toLights: Int) -> Int {
            return toLights + lightsToAdd
        }
        return buildRoads
    } else {
        return nil
    }
}

func evaluateBudget(budget: Int) -> Bool {
    return budget > 10000
}

stopLights = 4
if let townPlan = makeTownGrandSec(budget: 10001, condition: evaluateBudget) {
    stopLights = townPlan(4, stopLights)
}

print("Miasto ma \(stopLights) skrzyżowań ze światłami.")

// FUNKCJE WYŻSZEGO RZĘDU
// map(_:)

let precinctPopulations = [1244, 2021, 2157]
//let projectedPopulations = precinctPopulations.map{
//    (population: Int) -> Int in
//    return population * 2
//}
let projectedPopulations = precinctPopulations.map{ $0 * 2 }
projectedPopulations

// filter(_:)
let bigProjections = projectedPopulations.filter{ $0 > 4000 }
bigProjections

// reduce(_:combine:)
let totalProjetcion = projectedPopulations.reduce(0) { $0 + $1 }
totalProjetcion