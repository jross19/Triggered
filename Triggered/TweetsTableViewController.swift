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
                        var text = try tweetTextArray[tweetNumber].text()
                        
                        
                        
                        
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
}
   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


