//
//  Day.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation

struct Day: Codable {
    let celsiusMax: Double
    let celsiusMin: Double
    let fahrenheitMax: Double
    let fahrenheitMin: Double
    let celsiusAverage: Double
    let fahrenheitAverage: Double
    let averageHumidity: Double
    let chanceOfRain: Double
    let chanceOfSnow: Double
    let condition: Condition
    
    enum CodingKeys: String, CodingKey {
        case celsiusMax = "maxtemp_c"
        case celsiusMin = "mintemp_c"
        case fahrenheitMax = "maxtemp_f"
        case fahrenheitMin = "mintemp_f"
        case celsiusAverage = "avgtemp_c"
        case fahrenheitAverage = "avgtemp_f"
        case averageHumidity = "avghumidity"
        case chanceOfRain = "daily_chance_of_rain"
        case chanceOfSnow = "daily_chance_of_snow"
        case condition
    }
}
