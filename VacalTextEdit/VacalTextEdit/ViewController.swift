//
//  ViewController.swift
//  VacalTextEdit
//
//  Created by Tomek Buslowski on 28.08.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    let speechSynthesizer = NSSpeechSynthesizer()

    @IBOutlet var textView: NSTextView!
    
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        if let contents = textView.string, !contents.isEmpty {
            speechSynthesizer.startSpeaking(contents)
        } else {
            speechSynthesizer.startSpeaking("Dokument jest pusty.")
        }
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        speechSynthesizer.stopSpeaking()
    }


}

