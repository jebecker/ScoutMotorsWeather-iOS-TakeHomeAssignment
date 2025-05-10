//
//  ForecastView.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/10/25.
//

import SwiftUI

/// Forecast View to display a given date's forecast
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
