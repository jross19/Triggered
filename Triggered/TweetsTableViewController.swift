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
    
    var htmlContent = "" //html crap
    var testUserName = "realDonaldTrump"
    var tweetArray: [String] = [""]
    
    func webScrape(userName: String) {
        let myURLString = "https://twitter.com/\(userName))"
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
            do{
                
                let element = try doc.select("p").array()
                let element2 = try doc.select("title").first()
                let element3 = try doc.select("img").array()
                do {
                    var x = 4
                    
                    var thing = ""
                    while (x <= 6) {
                        let text = try element[x].text()
                        //print(text)
                        tweetArray.append(text)
                        //textView.text = thing
                        x = x + 1
                    }
                }
            }catch{
                
            }
            catch{
            }
            
        }catch{
            
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        webScrape(userName: testUserName)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

}
