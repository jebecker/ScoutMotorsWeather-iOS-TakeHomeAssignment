//
//  ForecastListViewModel.swift.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation

/// ForecastListViewModeling protocol to define publicly accessible properties/methods and to allow for easy testability
/// (can create mock objects using this protocol)
/// This protocol is marked as @MainActor since it manipulates UI when it's state changes
///  and those changes need to be done on the main thread
/// Used to help display Alarms inside AlarmListView
@MainActor
protocol ForecastListViewModeling {
    /// Array of ForecastDay objects which contain daily forecasts
    var forecasts: [ForecastDay] { get }
    // The users current location
    var location: Location { get }
    
    /// Method to fetch the 7 day forecast for a users current location
    func fetchSevenDayForecast() async 
}

@MainActor
@Observable
class ForecastListViewModel: ForecastListViewModeling {
    var api: WeatherAPIFetcher
    var forecasts: [ForecastDay] = []
    var location: Location = Location()
    
    init(api: WeatherAPIFetcher) {
        self.api = api
    }
    
    func fetchSevenDayForecast() async {
        guard let forecastResponse = await api.fetchSevenDayForecastForCurrentLocation() else {
            return
        }
        
        forecasts = forecastResponse.forecast.forecastDays
        location = forecastResponse.location
    }
}
