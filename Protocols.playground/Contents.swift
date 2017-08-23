//: Playground - noun: a place where people can play

import UIKit

protocol TabularDataStructure {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(_ row: Int) -> String
    func labelForColumn(_ column: Int) -> String
    
    func itemForRow(_ row: Int, column: Int) -> Int
}


func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}


func printTable(dataSource: TabularDataStructure & CustomStringConvertible) {
    
    let rowLabels = (0..<dataSource.numberOfRows).map{ dataSource.labelForRow( $0 ) }
    let columnLabels = (0..<dataSource.numberOfColumns).map{ dataSource.labelForColumn( $0 ) }
    
    // Size of label of each row
    let rowLabelWidths = rowLabels.map { $0.characters.count }
    
    guard let maxRowLabelWidth = rowLabelWidths.max() else {
        return
    }
    
    var firstRow: String = padding(amount: maxRowLabelWidth) + " |"
    
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    
    print("Tabela: \(dataSource.description)")
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(amount: paddingAmount) + itemString
        }
        print(out)
    }
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataStructure, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    var description: String {
        get {
            return "Departament (\(name))"
        }
    }
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    var numberOfRows: Int {
        get {
            return people.count
        }
    }
    
    var numberOfColumns: Int {
        get {
            return 2
        }
    }
    
    func labelForRow(_ row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(_ column: Int) -> String {
        switch column {
        case 0:
            return "Wiek"
        case 1:
            return "Lata doświadczenia"
        default:
            fatalError("Nieprawidłow kolumna!")
        }
    }
    
    func itemForRow(_ row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
        case 0:
            return person.age
        case 1:
            return person.yearsOfExperience
        default:
            fatalError("Nieprawidłowa kolumna!")
        }
    }
}

var department = Department(name: "Inżynieria")
department.addPerson(person: Person(name: "Tomek", age: 23, yearsOfExperience: 2))
department.addPerson(person: Person(name: "Patryk", age: 30, yearsOfExperience: 7))
department.addPerson(person: Person(name: "Kuba", age: 17, yearsOfExperience: 3))

printTable(dataSource: department)





protocol Toggleable {
    mutating func toggle()
}

enum Lightbulb: Toggleable {
    case On
    case Off
    
    mutating func toggle() {
        switch self {
        case .On:
            self = .Off
        case .Off:
            self = .On
        }
    }
}

class Candle: Toggleable {
    var isLighting = false
    
    // Class don't need mutating keyword because in Class we pass Reference.
    func toggle() {
        switch isLighting {
        case true:
            isLighting = false
        case false:
            isLighting = true
        }
    }
}

let candle = Candle()
candle.toggle()
candle.isLighting
candle.toggle()
candle.isLighting