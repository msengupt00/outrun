//
//  CreateViewController.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    let route = Route()
    
    @IBAction func fiveMinutes(_ sender: Any) {
        route.userTime = 5
    }
    @IBAction func tenMinutes(_ sender: Any) {
    }
    
    @IBAction func fifteenMinutes(_ sender: Any) {
    }
 

    @IBAction func oneMile(_ sender: UIButton) {
        route.userRadius = 1609.34
        route.createRoute(0,0,0)
    }
    
    @IBAction func threeMiles(_ sender: UIButton) {
    }
    
    
    @IBAction func fiveMiles(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

