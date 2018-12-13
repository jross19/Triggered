//
//  Test.swift
//  Triggered
//
//  Created by Nicholas Stearns on 12/13/18.
//  Copyright © 2018 Jonathan Ross. All rights reserved.
//
import Foundation
import UIKit

class Test: UIViewController {
    override func viewDidLoad() {
        // File path (change this).
        let path = "Desktop/Democrat/Republican.txt"
        
        do {
            // Read an entire text file into an NSString.
            let contents = try NSString(contentsOfFile: path, encoding: String.Encoding.ascii.rawValue)
            
            // Print all lines.
            contents.enumerateLines({ (line, stop) -> () in
                print("Line = \(line)")
                
            })
        }
    }
}
