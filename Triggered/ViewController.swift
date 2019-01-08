//
//  ViewController.swift
//  Triggered
//
//  Created by Jonathan Ross on 12/10/18.
//  Copyright © 2018 Jonathan Ross. All rights reserved.
//

import UIKit
import SwiftSoup //This is a module for Web Scraping
//import SwiftScraper

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var twitterProfileList: [profile] =
        [profile(profileName: "@realDonaldTrump", profileLink: "https://twitter.com/realDonaldTrump?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor", party: "Republican")]
    
    var htmlContent = "" //html crap
    
    override func viewDidLoad() {
        let myURLString = "https://twitter.com/MarkRuffalo"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        do {
            htmlContent = try String(contentsOf: myURL, encoding: .ascii)
            //print("HTML : \(htmlContent)")
        } catch let error {
            print("Error: \(error)")
        }
        
        
        do {
            
            let doc = try SwiftSoup.parse(htmlContent)
            do{
                
                let element = try doc.select("p").array()
                let element2 = try doc.select("title").first()
                let element3 = try doc.select("img").array()
                do {
                    var x = 4
                    
                    var thing = ""
                    while (x <= 6) {
                        let text = try element[x].text()
                        print(text)
                        thing.append("<> \(text)")
                        textView.text = thing
                        x = x + 1
                    }
                    }
                }catch{
                    
            }
            catch{
            }
            
        }catch{
            
        }
    }
    
    

}
