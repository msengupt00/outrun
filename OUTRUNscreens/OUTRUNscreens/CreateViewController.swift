//
//  CreateViewController.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CreateViewController: UIViewController, CLLocationManagerDelegate{
    
    let route = Route()
    
    let locationManager = CLLocationManager()
    var userCurrentLat = 0.0
    var userCurrentLong = 0.0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var fiveMins: UIButton!
    @IBOutlet weak var tenMins: UIButton!
    @IBOutlet weak var fifteenMins: UIButton!
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var mileOne: UIButton!
    @IBOutlet weak var mileThree: UIButton!
    @IBOutlet weak var mileFive: UIButton!
    
    @IBAction func fiveMinutes(_ sender: Any) {
        route.userTime = 5
        route.userRadius = 0
        
        //change button to reflect click
        fiveMins.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5)
        fiveMins.setTitleColor(UIColor.black, for: .normal)
 
        
        // Set other button's background color.
        tenMins.backgroundColor = UIColor.black
        fifteenMins.backgroundColor = UIColor.black
        
        // Set other button's title color.
        tenMins.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5), for: .normal)
        fifteenMins.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5), for: .normal)
    }
    @IBAction func tenMinutes(_ sender: Any) {
        route.userTime = 10
        route.userRadius = 0
        
        //change button to reflect click
        tenMins.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5)
        tenMins.setTitleColor(UIColor.black, for: .normal)
        
        // Set other button's background color.
        fiveMins.backgroundColor = UIColor.black
        fifteenMins.backgroundColor = UIColor.black
        
        // Set other button's title color.
        fiveMins.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5), for: .normal)
        fifteenMins.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5), for: .normal)
    }
    
    @IBAction func fifteenMinutes(_ sender: Any) {
        route.userTime = 15
        route.userRadius = 0
        
        //change button to reflect click
        fifteenMins.backgroundColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5)
        fifteenMins.setTitleColor(UIColor.black, for: .normal)
        
        // Set other button's background color.
        tenMins.backgroundColor = UIColor.black
        fiveMins.backgroundColor = UIColor.black
        
        // Set other button's title color.
        tenMins.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5), for: .normal)
        fiveMins.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5), for: .normal)
    }
 

    @IBAction func oneMile(_ sender: UIButton) {
        route.userRadius = 1609.34
        route.userTime = 0
        
    }
    
    @IBAction func threeMiles(_ sender: UIButton) {
        route.userRadius = 4828.03
        route.userTime = 0

    }
    
    @IBAction func fiveMiles(_ sender: UIButton) {
        route.userRadius = 8046.72
        route.userTime = 0
    }
    
    @IBAction func createWorkout(_ sender: UIButton) {
        route.createRoute(userCurrentLat,userCurrentLong,route.userRadius)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        // Do any additional setup after loading the view.
        
        // Set time button's background color.
        fiveMins.backgroundColor = UIColor.black
        tenMins.backgroundColor = UIColor.black
        fifteenMins.backgroundColor = UIColor.black
        
        // Set time button's title color.
        fiveMins.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5), for: .normal)
        tenMins.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5), for: .normal)
        fifteenMins.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5), for: .normal)
        
        // Set time button's corner radius.
        fiveMins.layer.cornerRadius = 30
        tenMins.layer.cornerRadius = 30
        fifteenMins.layer.cornerRadius = 30
        
        // Set time button's border width.
        fiveMins.layer.borderWidth = 1
        tenMins.layer.borderWidth = 1
        fifteenMins.layer.borderWidth = 1
        
        // Set time button's border color.
        fiveMins.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5).cgColor
        tenMins.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5).cgColor
        fifteenMins.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.5).cgColor
        
        //timeLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        
        
        
        // Set distance button's background color.
        mileOne.backgroundColor = UIColor.black
        mileThree.backgroundColor = UIColor.black
        mileFive.backgroundColor = UIColor.black
        
        // Set distance button's title color.
        mileOne.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        mileThree.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        mileFive.setTitleColor(UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25), for: .normal)
        
        // Set distance button's corner radius.
        mileOne.layer.cornerRadius = 30
        mileThree.layer.cornerRadius = 30
        mileFive.layer.cornerRadius = 30
        
        // Set distance button's border width.
        mileOne.layer.borderWidth = 1
        mileThree.layer.borderWidth = 1
        mileFive.layer.borderWidth = 1
        
        // Set distance button's border color.
        mileOne.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        mileThree.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha:0.25).cgColor
        mileFive.layer.borderColor = UIColor(red: 1.52, green: 0.56, blue: 1.16, alpha: 0.25).cgColor
        
        //distanceLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        userCurrentLat = locValue.latitude
        userCurrentLong = locValue.longitude
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    
}

