//
//  ForecastView.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/10/25.
//

import SwiftUI

/// Forecast View to display a given date's forecast
/// As this view is simply displaying passed in data and requires no extra logic, I have elected not to pair it with
/// a corresponding View Model. If this view were to ever change and does more than need to display data, I would add
/// a corresponding View Model
struct ForecastView: View {
    let forecast: ForecastDay
    let presentInCelsius: Bool
    
    var body: some View {
        HStack {
            Text(forecast.date)
            
            ForecastTemperatureView(dayWeather: forecast.day,
                                    presentInCelsius: presentInCelsius)

            ForecastConditionView(condition: forecast.day.condition)

        }
        .foregroundStyle(.primary)

    }
}
