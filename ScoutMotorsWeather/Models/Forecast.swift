//
//  Forecast.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation

struct Forecast: Codable {
    let forecastDays: [ForecastDay]
    
    enum CodingKeys: String, CodingKey {
        case forecastDays = "forecastday"
    }
}

struct ForecastDay: Codable, Identifiable, Equatable {
    var id = UUID()
    
    let date: String
    let day: DayWeather
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
    }
}
