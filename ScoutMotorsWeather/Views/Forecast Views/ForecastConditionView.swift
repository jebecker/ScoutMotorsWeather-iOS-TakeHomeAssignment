//
//  ForecastConditionView.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/10/25.
//

import SwiftUI

/// ForecastConditionView to display the weather conditions with an async image for the day
struct ForecastConditionView: View {
    let condition: Condition
    
    var body: some View {
        HStack {
            Spacer()
            
            Text(condition.text)
            
            AsyncImage(url: condition.iconURL) { image in
                image
                    .frame(width: 64.0, height: 64.0)
            } placeholder: {
                ProgressView()
            }
            
            Spacer()
        }
    }
}
