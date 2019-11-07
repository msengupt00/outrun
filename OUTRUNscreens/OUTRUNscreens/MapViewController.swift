//
//  SummaryViewController.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//


import UIKit
import Foundation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapMessage: UILabel!
    var directions : [String] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.]
        
        print(directions , "in map view")
        
        

    }
    
    
}
