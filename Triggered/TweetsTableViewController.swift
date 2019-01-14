//
//  TweetsTableViewController.swift
//  Triggered
//
//  Created by Jonathan Ross on 1/8/19.
//  Copyright © 2019 Jonathan Ross. All rights reserved.
//

import UIKit
import SwiftSoup

class TweetsTableViewController: UITableViewController {
    @IBOutlet weak var navTitle: UINavigationItem!
    
    var selectedRow: Int = 0
    var tweetsArray: [String] = []
    var htmlContent = "" //html crap
    var twitterAccount: profile = profile(profileName: "", party: "", profileImage: "")
    var tweetArray: [String] = [""]
    var imageLink: String = ""
    
    func webScrape(userName: String) {
        let myURLString = "https://twitter.com/\(userName)"
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
            do {
                let tweetTextArray = try doc.select("p").array()
                do {
                    var tweetNumber = 4 //the first number in the array
                    while (tweetNumber <= ((tweetTextArray.count) - 20)) {
                       
                        //avoids text that is meant to be hidden
                        let v = 0
                        while (v > -1 ) {
                            if ((try tweetTextArray[tweetNumber].attr("class")) == "u-hiddenVisually") {
                            tweetNumber += 1
                            }
                            else {
                                break
                            }
                        }
                    
                        //extracts the text from the element in the array
                        var text = ""
                        
                        while (text.isEmpty)
                        {
                         text = try checkForPic(tweetText: tweetTextArray[tweetNumber].text())
                            if (text.isEmpty) {
                                tweetNumber += 1
                            }
                        }
                        
                        
                        
                        
                            //replaces â with a quotation mark
                            if text.contains("â")
                            {
                                text = text.replacingOccurrences(of: "â", with: "\"", options: .literal, range: nil)
                            }
                        
                            //deletes a mistaken tweet
                        

                            
                        //adds the tweet text to an array
                        
                        tweetArray.append(text)
                        tweetNumber += 1
                    }
                    //removes empty string at beginning of array
                    tweetArray.remove(at: 0)
                    
                    //removes messy stuff at end of array
                    if (tweetArray[(tweetArray.count) - 1] == "@\(userName) hasn't Tweeted yet.") {
                        tweetArray.remove(at: (tweetArray.count) - 1)
                    }
                }
            }
            catch {
                
            }
        }
        catch {
            
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        navTitle.title = twitterAccount.profileName
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 124
        webScrape(userName: twitterAccount.profileName)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(tweetArray[(indexPath.row)])"
        return cell
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tweetArray.count
        } else {
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        // Segue to the second view controller
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! DetailViewController
        controller.politician = twitterAccount
        controller.tweetText = tweetArray[selectedRow]
    }
    
    func checkForPic(tweetText: String) -> String {
        var tweet = tweetText
        if tweet.contains("pic.twitter.com") {
            var i = tweet.range(of: "pic.twitter.com")
            var index = i?.lowerBound
            imageLink = tweet.substring(from: index!)
            tweet = tweet.substring(to: index!)
            return tweet
        }
        else {
            return tweet
        }
    }
    
    func checkForBlank(tweetText: String) -> Bool {
        return tweetText.isEmpty
        
    }
}
   

    
