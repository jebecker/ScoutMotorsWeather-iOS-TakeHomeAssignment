//
//  ScoutMotorsWeatherApp.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import SwiftUI

@main
struct ScoutMotorsWeatherApp: App {
    
    // create single instances of the necessary view model(s) and inject them into the view(s)
    private let forecastListViewModel = ForecastListViewModel(api: WeatherAPI())
    
    var body: some Scene {
        WindowGroup {
            ForecastListContainerView(viewModel: forecastListViewModel)
        }
    }
}
