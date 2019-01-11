//
//  PartyViewController.swift
//  Triggered
//
//  Created by Jonathan Ross on 1/10/19.
//  Copyright © 2019 Jonathan Ross. All rights reserved.
//

import UIKit

class PartyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sets the background color to a gradient
        //let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.green.cgColor]
        view.layer.insertSublayer(gradient, at: 0)
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
