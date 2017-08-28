//
//  Person.swift
//  CyclicalAssets
//
//  Created by Tomek Buslowski on 28.08.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    var assets = [Asset]()
    
    var description: String {
        return "Person: \(name)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Obiekt \(self) został usunięty z pamięci.")
    }
    
    func takeOwnerShipOfAssets(asset: Asset) {
        asset.owner = self
        assets.append(asset)
    }
}
