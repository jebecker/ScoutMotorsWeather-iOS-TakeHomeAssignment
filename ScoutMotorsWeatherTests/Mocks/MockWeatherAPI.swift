//
//  MockWeatherAPI.swift
//  ScoutMotorsWeatherTests
//
//  Created by Jayme Becker on 5/10/25.
//

import Foundation
@testable import ScoutMotorsWeather

final class MockWeatherAPI: WeatherAPIFetcher, @unchecked Sendable {
    
    var stubFetchSevenDayForecastForCurrentLocationResponse: ForecastResponse? = nil
    func fetchSevenDayForecastForCurrentLocation() async -> ForecastResponse? {
        stubFetchSevenDayForecastForCurrentLocationResponse
    }
}
