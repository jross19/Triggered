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
    
    var twitterProfileList: [profile] =
        [profile(profileName: "@realDonaldTrump", profileLink: "https://twitter.com/realDonaldTrump?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor", party: "Republican")]
    
    var htmlContent = "" //html crap
    
    override func viewDidLoad() {
        let myURLString = "https://twitter.com/realDonaldTrump"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        do {
            htmlContent = try String(contentsOf: myURL, encoding: .ascii)
            print("HTML : \(htmlContent)")
        } catch let error {
            print("Error: \(error)")
        }
        
        
        do {
            
            let doc = try SwiftSoup.parse(htmlContent)
            do{
                
                let element = try doc.select("title").first()
                do {
                    let text = try element?.text()
                    print(text)
                }catch{
                    
                }
            }catch{
            }
            
        }catch{
            
        }
    }
    
    
    
    
}
