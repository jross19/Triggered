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
    
    var tweetsArray: [String] = []
    var htmlContent = "" //html crap
    var testUserName = "realDonaldTrump"
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
                    while (tweetNumber <= 6) {
                        let text = try tweetTextArray[tweetNumber].text()
                        tweetArray.append(text)
                        tweetNumber += 1
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
        webScrape(userName: testUserName)
        tweetsArray.append(tweetArray[1])
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)
        let profile = tweetsArray[indexPath.row]
        cell.textLabel?.text = "\(tweetsArray[0])"
        return cell
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tweetsArray.count
        } else {
            return 0
        }
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


