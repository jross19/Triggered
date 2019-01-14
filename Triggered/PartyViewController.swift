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
        //Sets the background color to a gradient
        //let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.green.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ProfileTableViewController
        if (segue.identifier == "Republican") {
            controller.twitterProfileList = getRepublicanProfiles()
        }
        
        if (segue.identifier == "Democrat") {
            controller.twitterProfileList = getDemocratProfiles()
        }
    }
    
    @IBAction func democratSelected(_ sender: Any) {
        performSegue(withIdentifier: "Republican", sender: self)
    }
    
    @IBAction func republicanSelected(_ sender: Any) {
        performSegue(withIdentifier: "Democrat", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
