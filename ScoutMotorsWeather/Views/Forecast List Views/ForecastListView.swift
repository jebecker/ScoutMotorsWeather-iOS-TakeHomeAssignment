//
//  ForecastListView.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/10/25.
//

import SwiftUI

/// Enum defining the allowed temperature display settings
enum TemperatureDisplaySettings: String {
    case celsius = "C°"
    case fahrenheit = "F°"
}

/// View to show a list of ForecastView's with the ability to toggle between different temperature display settings
/// and present a detailed view for a specific forecast
struct ForecastListView: View {
    @State var temperatureDisplaySettings: TemperatureDisplaySettings = .fahrenheit
    let viewModel: ForecastListViewModeling
    
    var body: some View {
        List(viewModel.forecasts) { forecast in
            NavigationLink {
                ForecastDetailsView(
                    location: viewModel.location,
                    forecast: forecast,
                    presentInCelsius: temperatureDisplaySettings == .celsius
                )
            } label: {
                ForecastView(
                    forecast: forecast,
                    presentInCelsius: temperatureDisplaySettings == .celsius
                )
            }
        }
        .toolbar {
            Menu {
                Picker("Display Settings", selection: $temperatureDisplaySettings) {
                    Text("Fahrenheit").tag(TemperatureDisplaySettings.fahrenheit)
                    Text("Celsius").tag(TemperatureDisplaySettings.celsius)
                }
            } label: {
                Text("Temperature: \(temperatureDisplaySettings.rawValue)")
            }
        }
    }
}
