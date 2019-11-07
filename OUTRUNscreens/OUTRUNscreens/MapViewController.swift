//
//  SummaryViewController.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/1/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//


import UIKit
import Foundation
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapMessage: UILabel!
    
    var directions: [String:[String]] = [:]
    
    let locationManager = CLLocationManager()
    var currentCoordinate: CLLocationCoordinate2D!
        
    var stepCounter = 0
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.]
        
        print(directions , "in map view")
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager.startUpdatingLocation()
        

        }
    
    func getDirections() {
        print("lololololololol")
        if let checkNil = directions["Instructions"] {
            self.locationManager.monitoredRegions.forEach({ self.locationManager.stopMonitoring(for: $0) })
                
                let instructions = directions["Instructions"]!
                let coordinates =  directions["Coordinates"]!
                let distances = directions["Distances"]!
            
                for i in 0 ..< instructions.count {
                    let coordinate2D = CLLocationCoordinate2D(latitude: Double(coordinates[i * 2])!, longitude: Double(coordinates[i * 2 + 1])!)
                    let region = CLCircularRegion(center: coordinate2D,
                                                  radius: 0.1,
                                                  identifier: "\(i)")
                    self.locationManager.startMonitoring(for: region)
                }
                
                var initialMessage = instructions[0]
                print("\nthis is the initial message", initialMessage)
                initialMessage = initialMessage.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
                stepCounter = 1
            self.mapMessage.text = initialMessage.lowercased()
            }
    }
        
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.getDirections()
        manager.stopUpdatingLocation()
        guard let currentLocation = locations.first else { return }
        currentCoordinate = currentLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        if stepCounter < directions["Instructions"]!.count {
            var currentStep = directions["Instructions"]![stepCounter]
            var distToPoint = "In " + directions["Distances"]![stepCounter - 1]
            currentStep = currentStep.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
            currentStep = currentStep.lowercased()
            
            mapMessage.text = distToPoint + " " + currentStep
            stepCounter += 1

            print("Step Counter ", stepCounter)
        }
        else {
            mapMessage.text = "Arrived at destination"
            stepCounter = 0
            locationManager.monitoredRegions.forEach({ self.locationManager.stopMonitoring(for: $0) })
            
        }
    }
    
    func messageTextHelper() {
        
        
        
    }
}
