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
    
    var body: some View {
        HStack {
            Text(forecast.date)
            
            VStack(alignment: .leading) {
                Text("Avg: "
                     + String(format: "%.0f", forecast.day.fahrenheitAverage)
                     + "°")
                
                Text("H: " + String(format: "%.0f", forecast.day.fahrenheitMax) + "°")
                
                
                Text("L: " + String(format: "%.0f", forecast.day.fahrenheitMin) + "°")
            }

            HStack {
                Text(forecast.day.condition.text)

                Spacer()
                
                AsyncImage(url: createConditionImageURL(imageUrlString: forecast.day.condition.iconURL)) { image in
                    image
                        .frame(width: 64.0, height: 64.0)
                } placeholder: {
                    ProgressView()
                }
            }

        }
        .foregroundStyle(.primary)

    }
    
    
    private func createConditionImageURL(imageUrlString: String) -> URL {
        let fullUrlString = "https:" + imageUrlString
        return URL(string: fullUrlString)!
    }
}


//  Text(String(format: "%.0f", temperature) + "°F")
