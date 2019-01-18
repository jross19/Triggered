//
//  ProfileTableViewController.swift
//  Triggered
//
//  Created by Nicholas Stearns on 12/13/18.
//  Copyright © 2018 Jonathan Ross. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    @IBOutlet weak var navTitle: UINavigationItem!
    
    var selectedRow = 0
    
    // The array of twitter profiles used to get the republican profiles
    var twitterProfileList: [profile] =
        getRepublicanProfiles()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(red: 8/255, green: 19/255, blue: 48/255, alpha: 1) //sets background color
        
        
        //sets the navigation title
        navTitle.title = "Twitter users from the \(twitterProfileList[0].party) party!"

       
    }
    // Initializes the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwitterProfileCell", for: indexPath)
        cell.backgroundColor = UIColor.clear
        let profile = twitterProfileList[indexPath.row]
        cell.imageView?.image = UIImage(named: profile.profileImage)
        cell.textLabel?.text = "\(profile.profileName)"
        cell.textLabel?.textColor = UIColor.white
        cell.detailTextLabel?.text = "\(profile.party)"
        cell.detailTextLabel?.textColor = UIColor.white
        return cell
     
    }
    
    
    // Initializes the number of sections in the table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Initializes the number of rows per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return twitterProfileList.count
        } else {
            return 0
        }
    }
    // method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        // Segue to the second view controller
        self.performSegue(withIdentifier: "tweetSegue", sender: self)
    }
    
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let secondViewController = segue.destination as! TweetsTableViewController
        
        // set a variable in the second view controller with the data to pass
        secondViewController.twitterAccount = twitterProfileList[selectedRow]
    }
}

    

    

   
