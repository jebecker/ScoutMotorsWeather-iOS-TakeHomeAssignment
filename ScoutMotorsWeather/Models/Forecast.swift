//
//  Forecast.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation

struct Forecast: Codable {
    let forecast: ForecastDays
}

struct ForecastDays: Codable {
    let forecastDays: [ForecastDay]
    
    enum CodingKeys: String, CodingKey {
        case forecastDays = "forecastday"
    }
}

struct ForecastDay: Codable {
    let date: String
    let day: Day
}
