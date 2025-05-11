//
//  ForecastTemperatureView.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/10/25.
//

import SwiftUI

/// ForecastTemperatureView to show the Avg/Max/Min temperatures for the day
struct ForecastTemperatureView: View {
    let dayWeather: DayWeather
    let presentInCelsius: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                Text("Avg: ")
                
                Text(
                    String(format: "%.0f",
                           presentInCelsius ? dayWeather.celsiusAverage : dayWeather.fahrenheitAverage)
                )
                
                Text("°")
            }
            
            HStack(spacing: 0) {
                Text("H: ")
                
                Text(String(format: "%.0f",
                            presentInCelsius ? dayWeather.celsiusMax : dayWeather.fahrenheitMax))
                
                Text("°")
            }
            
            HStack(spacing: 0) {
                Text("L: ")
                
                Text(String(format: "%.0f",
                            presentInCelsius ? dayWeather.celsiusMin : dayWeather.fahrenheitMin))
                
                Text("°")
            }
        }
    }
}
