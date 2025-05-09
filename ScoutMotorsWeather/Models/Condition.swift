//
//  Condition.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation

struct Condition: Codable {
    let text: String
    let iconURL: String
    
    enum CodingKeys: String, CodingKey {
        case text
        case iconURL = "icon"
    }
}
