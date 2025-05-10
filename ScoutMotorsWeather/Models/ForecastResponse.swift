//
//  ForecastResponse.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation

/// ForecastResponse codable object used in the /forecast API call
struct ForecastResponse: Codable {
    let forecast: Forecast
    let location: Location
}
