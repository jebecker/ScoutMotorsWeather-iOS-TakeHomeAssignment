//
//  WeatherAPI.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation

protocol WeatherAPIFetcher {
    /// Async method to fetch a users 7 day forecast using their current location
    /// - Returns: A Forecast object or nil if it could not be fetched
    func fetchSevenDayForecastForCurrentLocation() async -> Forecast?
}

struct WeatherAPI: WeatherAPIFetcher {
    let locationManager: LocationManager
    
    func fetchSevenDayForecastForCurrentLocation() async -> Forecast? {
        do {
            let currentLocation = try await locationManager.requestLocation()
            let url = constructForecastEndpointURL(
                latitude: currentLocation.latitude,
                longitude: currentLocation.longitude
            )
            let (data, _) = try await URLSession.shared.data(from: url)
            let forecast = try JSONDecoder().decode(Forecast.self, from: data)
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
