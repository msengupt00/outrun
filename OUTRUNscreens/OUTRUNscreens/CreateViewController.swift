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
    
    @IBAction func fiveMinutes(_ sender: Any) {
        route.userTime = 5
    }
    @IBAction func tenMinutes(_ sender: Any) {
    }
    
    @IBAction func fifteenMinutes(_ sender: Any) {
    }
 

    @IBAction func oneMile(_ sender: UIButton) {
        route.userRadius = 1609.34
    }
    
    @IBAction func threeMiles(_ sender: UIButton) {
        route.userRadius = 4828.03

    }
    
    @IBAction func fiveMiles(_ sender: UIButton) {
        route.userRadius = 8046.72
    }
    
    @IBAction func createWorkout(_ sender: UIButton) {
        route.createHalfPoint(userCurrentLat,userCurrentLong,route.userRadius)
        route.createRoute(userCurrentLat, userCurrentLong)

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
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        userCurrentLat = locValue.latitude
        userCurrentLong = locValue.longitude
        //print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
    
    
}

