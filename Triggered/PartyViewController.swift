//
//  PartyViewController.swift
//  Triggered
//
//  Created by Jonathan Ross on 1/10/19.
//  Copyright © 2019 Jonathan Ross. All rights reserved.
//

import UIKit

class PartyViewController: UIViewController {
    @IBOutlet weak var navTitle: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Checks if user taps on republican icon or democrat icon
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ProfileTableViewController
        if (segue.identifier == "Republican") {
            controller.twitterProfileList = getRepublicanProfiles()
        }
        
        if (segue.identifier == "Democrat") {
            controller.twitterProfileList = getDemocratProfiles()
        }
    }
    
    // Performs the Republican segue
    @IBAction func democratSelected(_ sender: Any) {
        performSegue(withIdentifier: "Democrat", sender: self)
    }
    
    // Performs the Democrat segue
    @IBAction func republicanSelected(_ sender: Any) {
        performSegue(withIdentifier: "Republican", sender: self)
    }
    

}
