//
//  ViewController.swift
//  Triggered
//
//  Created by Jonathan Ross on 12/10/18.
//  Copyright © 2018 Jonathan Ross. All rights reserved.
//

import UIKit
import SwiftSoup //This is a module for Web Scraping
import Alamofire
//import SwiftScraper

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    // Grabs the HTML from nycmetalscene.com for parsing.
    func scrapeNYCMetalScene() -> Void {
        Alamofire.request("http://nycmetalscene.com").responseString { response in
            print("\(response.result.isSuccess)")
            if let html = response.result.value {
                self.parseHTML(html: html)
            }
        }
    }
    
    func parseHTML(html: String) -> Void {
        do{
            let html = "<html><head><title>First parse</title></head>"
                + "<body><p>Parsed HTML into a doc.</p></body></html>"
            let doc: Document = try SwiftSoup.parse(html)
            return try doc.text()
        }catch Exception.Error(let type, let message)
        {
            print("")
        }catch{
            print("")
        }
    }
    
}
