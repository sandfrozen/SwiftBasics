//: Playground - noun: a place where people can play

import UIKit

struct Town {
    
    var population = 5422
    
    enum Size {
        case male
        case srednie
        case duze
    }
    
    // Późna inicjalizacja - ustala się tylko raz, przy pierwszej próbie dostępu
    // Opóźniona właściwość składowana - nawias na końcu
    lazy var townSizeLazy: Size = {
        print("wywolalo")
        switch self.population {
        case 0...10000:
            return Size.male
        case 100001...100000:
            return Size.srednie
        default:
            return Size.duze
        }
    }()
    
    // Wartości obliczane - wartość ustalana za każdym razem w momencie pobierania
    
    var townSize: Size {
        get {
            switch self.population {
            case 0...10000:
                return Size.male
            case 10001...100000:
                return Size.srednie
            default:
                return Size.duze
            }
        }
    }
}

var t = Town()
var s = t.townSize
t.population = 50000
s = t.townSize