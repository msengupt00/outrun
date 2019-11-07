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
        print("FINISHED LOCATIONS")
        

        }
    
    func getDirections() {
        if let instructions = directions["Instructions"] {
            print("we got to the directions function")
            self.locationManager.monitoredRegions.forEach({ self.locationManager.stopMonitoring(for: $0) })
                
                let instructions = directions["Instructions"]!
                let coordinates =  directions["Coordinates"]!
            
                for i in 0 ..< instructions.count {
                    let instructionText = instructions[i]
                    let coordinate2D = CLLocationCoordinate2D(latitude: Double(coordinates[i * 2])!, longitude: Double(coordinates[i * 2 + 1])!)
                    print(instructionText)
                    let region = CLCircularRegion(center: coordinate2D,
                                                  radius: 20,
                                                  identifier: "\(i)")
                    self.locationManager.startMonitoring(for: region)
                }
                
                let initialMessage = instructions[0]
                let test = "     " + String(self.stepCounter) + " out of " + String(instructions.count)
                self.mapMessage.text = initialMessage + test
                self.stepCounter += 1
            }
    }
        
}

extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.getDirections()
        print("we got to did update location manager")
        manager.stopUpdatingLocation()
        guard let currentLocation = locations.first else { return }
        currentCoordinate = currentLocation.coordinate
    }
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("ENTERED")
        stepCounter += 1
        if stepCounter < directions["Instructions"]!.count {
            let currentStep = directions["Instructions"]![stepCounter]
            //let message = "In \(currentStep.distance) meters, \(currentStep.instructions)"
            mapMessage.text = currentStep
    
        } else {
            let message = "Arrived at destination"
            mapMessage.text = message
           
            stepCounter = 0
            locationManager.monitoredRegions.forEach({ self.locationManager.stopMonitoring(for: $0) })
            
        }
    }
}
