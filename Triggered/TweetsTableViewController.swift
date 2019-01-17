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
    
    var selectedRow: Int = 0 //Saves the row that the user clicked
    var htmlContent = "" //stores all of the html document
    var twitterAccount: profile = profile(profileName: "", party: "", profileImage: "") //stores the twitter account, passed from previous ViewController
    var tweetArray: [String] = [""] //Saves an array of all the tweets from one user
    var imageLink: String = "" //store the pic.twitter.com link
    
    
     //Function that takes in a String for the username of the twitter account and stores the text of the user's tweets in an array
    func webScrape(userName: String) {
        let myURLString = "https://twitter.com/\(userName)"
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        do {
            htmlContent = try String(contentsOf: myURL, encoding: .ascii) //gets the html content of the webpage
        } catch let error {
            //prints error if there is an error getting content from the url
            print("Error: \(error)")
        }
        
        
        do {
            let doc = try SwiftSoup.parse(htmlContent) //parses the webpage
            do {
                let tweetTextArray = try doc.select("p").array() //creates an array of text with tag p
                do {
                    var tweetNumber = 4 //the first number in the array (using 4 because that is where the tweets start)
                    while (tweetNumber <= ((tweetTextArray.count) - 20)) { //loops through tweets on first page load
                        
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
        //sets up the ViewController, running all of the functions required to display tweets
        super.viewDidLoad()
        navTitle.title = twitterAccount.profileName
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 124
        webScrape(userName: twitterAccount.profileName)
    }
    //sets up the tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(tweetArray[(indexPath.row)])"
        return cell
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //gets the count of the cells
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tweetArray.count
        } else {
            return 0
        }
    }
    
    //allows segue when row is clicked
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        // Segue to the second view controller
        self.performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    //prepares for segue and pushes required values to next viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! DetailViewController
        controller.politician = twitterAccount
        controller.tweetText = tweetArray[selectedRow]
    }
    
    func checkForPic(tweetText: String) -> String {
        var tweet = tweetText
        if tweet.contains("pic.twitter.com") //checkes if the tweet contains a pic.twitter.com link
        {
            let i = tweet.range(of: "pic.twitter.com") //gets the range of the pic link
            let index = i?.lowerBound //gets the first index of the link
            imageLink = tweet.substring(from: index!) //gets the text of the link
            tweet = tweet.substring(to: index!) //changes the detail text to everything before the pic link
            
            return tweet
        }
        else {
            return tweet
        }
    }
    
    //checks if the tweet text is empty
    func checkForBlank(tweetText: String) -> Bool {
        return tweetText.isEmpty
        
    }
}
   

    
