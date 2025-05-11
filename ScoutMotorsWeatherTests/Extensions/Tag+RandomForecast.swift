//
//  Tag+RandomForecast.swift
//  ScoutMotorsWeatherTests
//
//  Created by Jayme Becker on 5/10/25.
//

import Testing
@testable import ScoutMotorsWeather

/// RandomForecast extension on Tag to be able to share methods across test suites marked with .tags(.randomForecastNeeded)
extension Tag {
    @Tag static var randomForecastNeeded: Self
    
    static func randomForecastResponse() -> ForecastResponse {
        ForecastResponse(forecast: randomForecast(),
                         location: randomLocation())
    }
    
    static func randomForecast() -> Forecast {
        Forecast(forecastDays: randomForecastDays())
    }
    
    static func randomLocation() -> Location {
        Location(
            name: String.randomString(),
            country: String.randomString(),
            lat: Double.random(in: -100...100),
            lon: Double.random(in: -100...100)
        )
    }
    
    static func randomForecastDays() -> [ForecastDay] {
        Array(repeating: randomForecastDay(),
              count: Int.random(in: 1...20))
    }
    
    static func randomForecastDay() -> ForecastDay {
        ForecastDay(date: String.randomString(),
                    day: randomDayWeather())
    }
    
    static func randomDayWeather() -> DayWeather {
        DayWeather(
            celsiusMax: Double.random(in: -100...100),
            celsiusMin: Double.random(in: -100...100),
            fahrenheitMax: Double.random(in: -100...100),
            fahrenheitMin: Double.random(in: -100...100),
            celsiusAverage: Double.random(in: -100...100),
            fahrenheitAverage: Double.random(in: -100...100),
            averageHumidity: Double.random(in: -100...100),
            chanceOfRain: Double.random(in: -100...100),
            chanceOfSnow: Double.random(in: -100...100),
            condition: randomCondition()
        )
    }
    
    static func randomCondition() -> Condition {
        Condition(text: String.randomString(),
                  iconUrlString: String.randomString())
    }
}
