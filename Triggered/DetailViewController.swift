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
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var tweetView: UITextView!
    @IBOutlet weak var contentImage: UIImageView!
    
    var htmlContent = "" //html crap
    
    var politician: profile = profile(profileName: "", party: "", profileImage: "")
    
    var tweetText = ""
    
    var imageLink: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileName.text = politician.profileName
        profileImage.image = UIImage(named: politician.profileImage)
        tweetView.text = checkForPic(tweetText: tweetText)

        // Do any additional setup after loading the view.
    }
    
                
           
            func checkForPic(tweetText: String) -> String {
                var tweet = tweetText
                if tweet.contains("pic.twitter.com")
                {
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

   
}
