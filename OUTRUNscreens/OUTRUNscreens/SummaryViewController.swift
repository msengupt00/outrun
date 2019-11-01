//
//  SummaryViewController.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//


import UIKit
import Foundation

class SummaryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let k = Draw(frame: CGRect(
            origin: CGPoint(x: 50, y: 50),
            size: CGSize(width: 100, height: 100)))
        
        // Add the view to the view hierarchy so that it shows up on screen
        self.view.addSubview(k)
    }
    
    
}
