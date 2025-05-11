//
//  Condition.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation

struct Condition: Codable, Equatable {
    let text: String
    let iconUrlString: String
    
    /// Convenience computed property to convert the icon url string into a real URL
    var iconURL: URL {
        let fullUrlString = "https:" + iconUrlString
        return URL(string: fullUrlString)!
    }
    
    enum CodingKeys: String, CodingKey {
        case text
        case iconUrlString = "icon"
    }
}
