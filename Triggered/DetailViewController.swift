//
//  DetailViewController.swift
//  Triggered
//
//  Created by Jonathan Ross on 1/11/19.
//  Copyright © 2019 Jonathan Ross. All rights reserved.
//

import UIKit
import SwiftSoup

class DetailViewController: UIViewController {
    //Outlets for content of the page
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var tweetView: UITextView!
    @IBOutlet weak var contentImage: UIImageView! //This image view is not currently used
    
    //stores the content of the politician, which is provided by the previous ViewController
    var politician: profile = profile(profileName: "", party: "", profileImage: "")
    
    //stores the text of the tweet, provided by last ViewController
    var tweetText = ""
    
    //used in the checkForPic function to store a pic.twitter.com link
    var imageLink: String = ""
    
    //sets up the ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
         self.view.backgroundColor = UIColor(red: 8/255, green: 19/255, blue: 48/255, alpha: 1) //sets background color
        tweetView.textColor = UIColor.white
        tweetView.backgroundColor = UIColor.clear
        profileName.textColor = UIColor.white
        profileName.text = politician.profileName //extracts the profile name and stores it
        profileImage.image = UIImage(named: politician.profileImage) //extracts the profile image and stores it
        tweetView.text = checkForPic(tweetText: tweetText) //removes pic.twitter.com from the tweet

        // Do any additional setup after loading the view.
    }
    
                
           //removes the pic.twitter.com links from the tweet
            func checkForPic(tweetText: String) -> String {
                var tweet = tweetText
                if tweet.contains("pic.twitter.com") //checkes if the tweet contains a pic.twitter.com link
                {
                    let i = tweet.range(of: "pic.twitter.com") //gets the range of the pic link
                    let index = i?.lowerBound //gets the first index of the link
                    imageLink = String(tweet[index!...]) //gets the text of the link
                    tweet = String(tweet.prefix(upTo: index!)) //changes the detail text to everything before the pic link
                    
                    return tweet
                }
                else {
                    return tweet
                }
            }

   
}
