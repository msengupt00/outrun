//
//  Routes.swift
//  OUTRUNscreens
//
//  Created by Mohona Sengupta on 11/2/19.
//  Copyright © 2019 Mohona Sengupta. All rights reserved.
//

import Foundation

class Route {
    var userTime: Int = 0
    var userRadius: Float = 0
    var apiKey = "AIzaSyD2sEnjE9LViaXMgvguCboMgDiaml1wdVY"
    
    func createRoute(_ userLocationLat: Int, _ userLocationLong: Int, _ userRadius: Int) {
        
//        let apicall: String = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=" + userLocationLat + "," + userLocationLong + "&radius=" + userRadius/2 + "&key= " + apiKey
        
        let apicall = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.445297,-79.941479&radius=1609.34&key=AIzaSyD2sEnjE9LViaXMgvguCboMgDiaml1wdVY"

        
        //let locations = places(apicall)
        
        
        places(apicall, userCompletionHandler: { results, error in
          
          if let results = results {
            for result in results {
                print(result)
            }
            }
            
            })
          }
            
        }
    
