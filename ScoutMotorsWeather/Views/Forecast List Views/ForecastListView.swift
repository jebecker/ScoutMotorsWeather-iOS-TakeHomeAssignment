//
//  ForecastListView.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/10/25.
//

import SwiftUI

enum TemperatureDisplaySettings: String {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
}

/// View to show a list of ForecastView's with the ability to toggle between different temperature display settings
struct ForecastListView: View {
    @State var temperatureDisplaySettings: TemperatureDisplaySettings = .fahrenheit
    let viewModel: ForecastListViewModeling
    
    var body: some View {
        List(viewModel.forecasts) { forecast in
            ForecastView(forecast: forecast, presentInCelsius: temperatureDisplaySettings == .celsius)
        }
        .toolbar {
            Menu {
                Picker("Display Settings", selection: $temperatureDisplaySettings) {
                    Text("Fahrenheit").tag(TemperatureDisplaySettings.fahrenheit)
                    Text("Celsius").tag(TemperatureDisplaySettings.celsius)
                }
            } label: {
                Text(temperatureDisplaySettings.rawValue)
            }
        }
    }
}
