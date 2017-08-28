//
//  Document.swift
//  VacalTextEdit
//
//  Created by Tomek Buslowski on 28.08.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    var contents = ""

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: "Document Window Controller") as! NSWindowController
        
        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents
        
        self.addWindowController(windowController)
    }

    override func data(ofType typeName: String) throws -> Data {
        let windowController = windowControllers[0]
        let viewController = windowController.contentViewController as! ViewController
        
        let contents = viewController.textView.string ?? ""
        
        if let data = contents.data(using: String.Encoding.utf8) {
            return data
        } else {
            let userInfo = [ NSLocalizedRecoverySuggestionErrorKey: "Pliku nie można zapisać jako UTF-8"]
            throw NSError(domain: "com.frozensand.VocalTextEdit", code: 0, userInfo: userInfo)
        }
    }

    override func read(from data: Data, ofType typeName: String) throws {
        if let contents = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String {
            
            self.contents = contents
            
        } else {
            let userInfo = [ NSLocalizedRecoverySuggestionErrorKey: "To nie jest poprawny plik UTF-8"]
            throw NSError(domain: "com.frozensand.VocalTextEdit", code: 0, userInfo: userInfo)
        }
    }


}

