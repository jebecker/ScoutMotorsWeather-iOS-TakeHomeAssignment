//
//  ForecastListViewModelTests.swift
//  ScoutMotorsWeatherTests
//
//  Created by Jayme Becker on 5/10/25.
//

import Testing
@testable import ScoutMotorsWeather

@Suite(.tags(.randomForecastNeeded))
@MainActor
struct ForecastListViewModelTests {
    
    @Test func fetchSevenDayForecastSuccess() async {
        let mockWeatherAPI = MockWeatherAPI()
        let expectedForecastResponse = Tag.randomForecastResponse()
        mockWeatherAPI.stubFetchSevenDayForecastForCurrentLocationResponse = expectedForecastResponse
        
        let sut = ForecastListViewModel(api: mockWeatherAPI)
        await sut.fetchSevenDayForecast()
        
        #expect(sut.forecasts == expectedForecastResponse.forecast.forecastDays)
        #expect(sut.location == expectedForecastResponse.location)
    }
    
    @Test func fetchSevenDayForecastFial() async {
        let expectedLocation = Location(name: "", country: "", lat: 0, lon: 0)
        let sut = ForecastListViewModel(api: MockWeatherAPI())
        await sut.fetchSevenDayForecast()
        
        #expect(sut.forecasts.isEmpty)
        #expect(sut.location == expectedLocation)
    }
}
