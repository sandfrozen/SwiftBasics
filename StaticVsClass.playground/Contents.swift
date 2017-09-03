//: Playground - noun: a place where people can play

import UIKit

class House {

    // static property should be <<< let >>>
    static let region: String = "Europe"
    
    // nonsense: static property can be <<< var >>>
    static var country: String = "Poland"
    
    // (static) COMPUTED property cannot be <<< let >>>s
    // nonsense: static property shouldn't be computed
    static var voivodeship: String {
        return "Podlasie"
    }
    
    class var address: String {
        return "Bialystok"
    }
    
    static func fullInfo() -> String {
        return "This house is in \(address), \(voivodeship), \(country), \(region)."
    }
    
    class func shortInfo() -> String {
        return "This house is in \(address)."
    }
}

House.address
print(House.fullInfo())
print(House.shortInfo())

class Apartment: House {
    
    // static property cannot be overridden
    //override static var country: String = "Slovakia"
    
    // class property cen be override
    override class var address: String {
        return "Monte Bianco"
    }
    
    // static method cannot be overridden
//    override static func fullInfo() -> String {
//        return "This house is in \(address), \(voivodeship), \(country), \(region)."
//    }
    
    override class func shortInfo() -> String {
        return "This apartment is in \(address)."
    }
}

Apartment.address
print(Apartment.fullInfo())
print(Apartment.shortInfo())