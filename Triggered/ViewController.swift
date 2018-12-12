//
//  ViewController.swift
//  Triggered
//
//  Created by Jonathan Ross on 12/10/18.
//  Copyright © 2018 Jonathan Ross. All rights reserved.
//

import UIKit
import SwiftSoup //This is a module for Web Scraping

class ViewController: UIViewController {
    
    typealias Item = (text: String, html: String)
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var cssTextField: UITextField!
    
    var urlTextField: String = "twitter.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // current document
    var document: Document = Document.init("")
    // item founds
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "SwiftSoup Example"
        
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        
        urlTextField = "http://www.facebook.com"
        cssTextField.text = "div"
        
        // start first request
        downloadHTML()
    }
    
    //Download HTML
    func downloadHTML() {
        // url string to URL
        guard let url = URL(string: urlTextField ) else {
            // an error occurred
            UIAlertController.showAlert("Error: \(urlTextField ) doesn't seem to be a valid URL", self)
            return
        }
        
        do {
            // content of url
            let html = try String.init(contentsOf: url)
            // parse it into a Document
            document = try SwiftSoup.parse(html)
            // parse css query
            parse()
        } catch let error {
            // an error occurred
            UIAlertController.showAlert("Error: \(error)", self)
        }
        
    }
    
    //Parse CSS selector
    func parse() {
        do {
            //empty old items
            items = []
            // firn css selector
            let elements: Elements = try document.select(cssTextField.text ?? "")
            //transform it into a local object (Item)
            for element in elements {
                let text = try element.text()
                let html = try element.outerHtml()
                items.append(Item(text: text, html: html))
            }
            
        } catch let error {
            UIAlertController.showAlert("Error: \(error)", self)
        }
        
        tableView.reloadData()
    }
}
