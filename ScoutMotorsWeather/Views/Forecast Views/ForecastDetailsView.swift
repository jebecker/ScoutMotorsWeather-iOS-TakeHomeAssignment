//
//  ForecastDetailsView.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/10/25.
//

import SwiftUI

/// Forecast Details View to display all details related to a specific Forecast
/// As this view is simply displaying passed in data and requires no extra logic, I have elected not to pair it with
/// a corresponding View Model. If this view were to ever change and do more than display data, I would add
/// a corresponding View Model.
struct ForecastDetailsView: View {
    let location: Location
    let forecast: ForecastDay
    let presentInCelsius: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            ForecastConditionView(condition: forecast.day.condition)
            
            Text("Date: \(forecast.date)")
            
            ForecastTemperatureView(dayWeather: forecast.day,
                                    presentInCelsius: presentInCelsius)
            
            Text("Rain chance: \(String(format: "%.0f", forecast.day.chanceOfRain))%")
            
            Text("Snow chance: \(String(format: "%.0f", forecast.day.chanceOfSnow))%")
            
            Text("Avg Humidity: \(String(format: "%.0f", forecast.day.averageHumidity))%")
            
            Spacer()
        }
        .padding()
        .foregroundStyle(.primary)
        .navigationTitle("\(location.name), \(location.region)")
    }
}
