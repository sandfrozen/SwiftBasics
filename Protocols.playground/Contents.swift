//: Playground - noun: a place where people can play

import UIKit

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0..<amount {
        paddingString += " "
    }
    return paddingString
}


func printTable(columnLabels: [String], rowLabels: [String], data: [[Int]] ) {
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
    print(firstRow)
    
    for (i, row) in data.enumerated() {
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(amount: paddingAmount) + " |"
        
        for (j, item) in row.enumerated() {
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(amount: paddingAmount) + itemString
        }
        print(out)
    }
}

let columnLabels = ["Wiek", "Lata doświadczenia"]
let rowLabels = ["Tomek", "Kuba", "Patryk"]
let data = [
    [30, 6],
    [40, 18],
    [50, 20]
]

printTable(columnLabels: columnLabels, rowLabels: rowLabels, data: data)
