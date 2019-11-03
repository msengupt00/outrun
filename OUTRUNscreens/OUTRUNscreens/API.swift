import Foundation


//Step 1: user is at morewood ave and wants to go on a 1 mile walk
//Step 2: give google starting location, radius 0.5 miles -- nearby Places search
//Step 3: feed starting location and random place (destination) into api call below
//Step 4: call opposite route back home



//url0 - api call to Places


func places(_ apicall: String, userCompletionHandler: @escaping (Array<Any>?, Error?) -> Void) {
    
    var locations: [Any] = []
    
    struct Welcome0: Decodable {
        //let htmlAttributions: [JSONAny]
        let nextPageToken: String
        let results: [Result]
        let status: String
        
        enum CodingKeys: String, CodingKey {
            case nextPageToken = "next_page_token"
            case results, status
        }
    }

    // MARK: - Result
    struct Result: Decodable {
        let geometry: Geometry
//        let icon: String
        let id, name: String
//        let photos: [Photo]
//        let placeID, reference: String
//        let scope: Scope
//        let types: [String]
//        let vicinity: String
//        let openingHours: OpeningHours?
//        let plusCode: PlusCode?
//        let rating: Double?
//        let userRatingsTotal, priceLevel: Int?
        
        enum CodingKeys: String, CodingKey {
            case geometry, id, name
//            case placeID = "place_id"
//            case reference, scope, types, vicinity
//            case openingHours = "opening_hours"
//            case plusCode = "plus_code"
//            case rating
//            case userRatingsTotal = "user_ratings_total"
//            case priceLevel = "price_level"
        }
    }

    // MARK: - Geometry
    struct Geometry: Decodable {
        let location: Location
        //let viewport: Viewport
    }

     //MARK: - Location
    struct Location: Decodable {
        let lat, lng: Double
    }

    // MARK: - Viewport
//    struct Viewport: Decodable {
//        let northeast, southwest: Location
//    }
//
//    // MARK: - OpeningHours
//    struct OpeningHours: Decodable {
//        let openNow: Bool
//
//        enum CodingKeys: String, CodingKey {
//            case openNow = "open_now"
//        }
//    }
//
//    // MARK: - Photo
//    struct Photo: Decodable {
//        let height: Int
//        let photoReference: String
//        let width: Int
//
//        enum CodingKeys: String, CodingKey {
//            case height
//            case photoReference = "photo_reference"
//            case width
//        }
//    }
//
//    // MARK: - PlusCode
//    struct PlusCode: Decodable {
//        let compoundCode, globalCode: String
//
//        enum CodingKeys: String, CodingKey {
//            case compoundCode = "compound_code"
//            case globalCode = "global_code"
//        }
//    }
//
//    enum Scope: String, Codable {
//        case google = "GOOGLE"
//    }

      let url = URL(string: apicall)!
      let task0 = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in

        guard let data = data else { return }
        do {
          // parse json data and return it
            
            guard let welcome0 = try? JSONDecoder().decode(Welcome0.self, from: data) else {
                print("Error: Couldn't decode data into a result")
                return
            }
            
            for result in welcome0.results {
                let latLong = String(result.geometry.location.lat) + ", " + String(result.geometry.location.lng) + ": " + result.name
                locations.append(latLong)
            }
            print()
            
            userCompletionHandler(locations, nil)
          
        }
      })
      
      task0.resume()
      // function will end here and return
      // then after receiving HTTP response, the completionHandler will be called
    }

//    let task0 = URLSession.shared.dataTask(with: URL(string: url0)!) { (data, response, error) in
//        guard let data = data else {
//            print("Error: No data to decode")
//            return
//        }
//
//        guard let welcome0 = try? JSONDecoder().decode(Welcome0.self, from: data) else {
//            print("Error: Couldn't decode data into a result")
//            return
//        }
//
//        // Output
//        for result in welcome0.results {
//            print("Latitude: \(result.geometry.location.lat) of \(result.name)")
//            print("Longitude: \(result.geometry.location.lng) of \(result.name)")
//        }
//        print()
//
//    }
//    task0.resume()
//    return {}
//}


func maps() -> String {

    //url - api call to Maps
    let url = "https://maps.googleapis.com/maps/api/directions/json?origin=40.445297,-79.941479&destination=40.448832,-79.945698&avoid=highways&mode=walking&key=AIzaSyD2sEnjE9LViaXMgvguCboMgDiaml1wdVY"


    // MARK: - Welcome
    struct Welcome: Decodable {
        let geocodedWaypoints: [GeocodedWaypoint]
        let routes: [Route]
        let status: String
        
        enum CodingKeys: String, CodingKey {
            case geocodedWaypoints = "geocoded_waypoints"
            case routes
            case status
        }
    }

    // MARK: - GeocodedWaypoint
    struct GeocodedWaypoint: Decodable {
        let geocoderStatus, placeID: String
        let types: [String]
        
        enum CodingKeys: String, CodingKey {
            case geocoderStatus = "geocoder_status"
            case placeID = "place_id"
            case types
        }
    }

    // MARK: - Route
    struct Route: Decodable {
        let bounds: Bounds
        let copyrights: String
        let legs: [Leg]
        let overviewPolyline: Polyline
        let summary: String
        let warnings: [String]
    //    let waypointOrder: [JSONAny]
        
        enum CodingKeys: String, CodingKey {
            case bounds, copyrights, legs
            case overviewPolyline = "overview_polyline"
            case summary, warnings
    //        case waypointOrder = "waypoint_order"
        }
    }

    // MARK: - Bounds
    struct Bounds: Decodable {
        let northeast, southwest: Northeast
    }

    // MARK: - Northeast
    struct Northeast: Decodable {
        let lat, lng: Double
    }

    // MARK: - Leg
    struct Leg: Decodable {
        let distance, duration: Distance
        let endAddress: String
        let endLocation: Northeast
        let startAddress: String
        let startLocation: Northeast
        let steps: [Step]
    //    let trafficSpeedEntry, viaWaypoint: [JSONAny]
        
        enum CodingKeys: String, CodingKey {
            case distance, duration
            case endAddress = "end_address"
            case endLocation = "end_location"
            case startAddress = "start_address"
            case startLocation = "start_location"
            case steps
    //        case trafficSpeedEntry = "traffic_speed_entry"
    //        case viaWaypoint = "via_waypoint"
        }
    }

    // MARK: - Distance
    struct Distance: Decodable {
        let text: String
        let value: Int
    }

    // MARK: - Step
    struct Step: Decodable {
        let distance, duration: Distance
        let endLocation: Northeast
        let htmlInstructions: String
        let polyline: Polyline
        let startLocation: Northeast
        let travelMode: String
        let maneuver: String?
        
        enum CodingKeys: String, CodingKey {
            case distance, duration
            case endLocation = "end_location"
            case htmlInstructions = "html_instructions"
            case polyline
            case startLocation = "start_location"
            case travelMode = "travel_mode"
            case maneuver
        }
    }

    // MARK: - Polyline
    struct Polyline: Decodable {
        let points: String
    }



    //verify that data is valid
    let task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
        guard let data = data else {
            print("Error: No data to decode")
            return
        }
        
        guard let welcome = try? JSONDecoder().decode(Welcome.self, from: data) else {
            print("Error: Couldn't decode data into a result")
            return
        }
        
        // Output
        for route in welcome.routes {
            for leg in route.legs {
                print("Your adventure will last " + leg.duration.text + " and you will walk for " + leg.distance.text + "!")
                for step in leg.steps {
                    print(step.htmlInstructions + "for " + step.distance.text)
                }
            }
        }
        print()
    }

    task.resume()
    
    return("MAP!")

}

