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
        // Finish this next
    }
    
}
