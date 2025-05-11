//
//  Location.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation

struct Location: Codable, Equatable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    
    // Convenience init for usability
    init(
        name: String = "",
        region: String = "",
        country: String = "",
        lat: Double = 0,
        lon: Double = 0
    ) {
        self.name = name
        self.region = region
        self.country = country
        self.lat = lat
        self.lon = lon
    }
}
