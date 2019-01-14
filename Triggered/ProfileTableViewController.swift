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
    
    var twitterProfileList: [profile] =
        getRepublicanProfiles()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sets the navigation title
        navTitle.title = "I hope you hate \(twitterProfileList[0].party)s!"

       
    }
    // Initializes the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TwitterProfileCell", for: indexPath)
        let profile = twitterProfileList[indexPath.row]
        cell.imageView?.image = UIImage(named: profile.profileImage)
        cell.textLabel?.text = "\(profile.profileName)"
        cell.detailTextLabel?.text = "\(profile.party)"
        return cell
     
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
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

    

    

   
