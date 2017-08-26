//: Playground - noun: a place where people can play

import UIKit

protocol ExerciseType: CustomStringConvertible{
    var name: String { get }
    var title: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}

extension ExerciseType {
    var description: String {
        return "Ćwiczenie \(name) pozwoliło spalić \(caloriesBurned) kalorii w ciągu \(minutes) minut."
    }
}

struct EllipticalTrainer: ExerciseType {
    let name = "Trenażer eliptyczny"
    let title = "Superszybki trenażer eliptyczny 3000"
    let caloriesBurned: Double
    let minutes: Double
}

let ellipticalWorkout = EllipticalTrainer(caloriesBurned: 335, minutes: 30)


struct Treadmill: ExerciseType {
    let name = "Bieżnia"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
}

extension Treadmill {
    var description: String {
        return "\(name)(\(caloriesBurned) kalorii i \(distanceInMiles) mil w ciągu \(minutes) minut)."
    }
}

let runningWorkout = Treadmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)

print(ellipticalWorkout.description)
print(runningWorkout.description)


//func caloriesBurnedPerMinute<Execise: ExerciseType>(execise: Execise) -> Double {
//    return execise.caloriesBurned / execise.minutes
//}
//
//print(caloriesBurnedPerMinute(execise: ellipticalWorkout))
//print(caloriesBurnedPerMinute(execise: runningWorkout))

extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}
print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)


extension Sequence where Iterator.Element == ExerciseType {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [ExerciseType] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())


extension ExerciseType {
    var title: String {
        return "\(name) - \(minutes) minut"
    }
}

for exercise in mondayWorkout {
    print(exercise.title)
}
print(ellipticalWorkout.title)
