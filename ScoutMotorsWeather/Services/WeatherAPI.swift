//
//  WeatherAPI.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation

protocol WeatherAPIFetcher: Sendable {
    /// Async method to fetch a users 7 day forecast using their current location
    /// - Returns: A ForecastResponse object or nil if it could not be fetched
    func fetchSevenDayForecastForCurrentLocation() async -> ForecastResponse?
}


/// WeatherAPI marked with @MainActor in order to work with LocationManager
@MainActor
struct WeatherAPI: WeatherAPIFetcher {
    let locationManager: LocationManaging
    
    init() {
        self.locationManager = LocationManager()
    }
    
    func fetchSevenDayForecastForCurrentLocation() async -> ForecastResponse? {
        do {
            // request location use authorization if needed
            await locationManager.requestAuthorizationIfNeeded()
            // grab the users current location
            let currentLocation = try await locationManager.requestLocation()
            
            // construct the URL and make the API request
            let url = constructForecastEndpointURL(
                latitude: currentLocation.latitude,
                longitude: currentLocation.longitude
            )
            let (data, _) = try await URLSession.shared.data(from: url)
            let forecast = try JSONDecoder().decode(ForecastResponse.self, from: data)
            return forecast
        } catch {
            print(error)
            return nil
        }
    }
    
    // MARK: Private methods
    
    private func constructForecastEndpointURL(latitude: Double, longitude: Double) -> URL {
        let endpoint = "https://api.weatherapi.com/v1/forecast.json"
        let apiKey = "207df25fc4a04522a6a202159250905"
        
        let url = URL(string: endpoint)!
        let queryItems = [
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "q", value: "\(latitude),\(longitude)"),
            URLQueryItem(name: "days", value: "7"),
        ]
        let fullURL = url.appending(queryItems: queryItems)
        return fullURL
    }
}
