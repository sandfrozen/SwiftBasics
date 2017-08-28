//
//  Asset.swift
//  CyclicalAssets
//
//  Created by Tomek Buslowski on 28.08.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation

class Asset: CustomStringConvertible {
    let name: String
    let value: Double
    weak var owner: Person?
    
    var description: String {
        if let actualOwner = owner {
            return "Zasób \(name) o wartosci \(value), którego właścicielem jest \(actualOwner)"
        } else {
            return "Zasób \(name) o wartosci \(value), który nie ma właściciela"
        }
    }
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
    
    deinit {
        print("Obiekt \(self) został usunięty.")
    }
}
