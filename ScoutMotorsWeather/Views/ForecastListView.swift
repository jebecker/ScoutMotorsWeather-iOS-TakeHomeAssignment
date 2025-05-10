//
//  ForecastListView.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/10/25.
//

import SwiftUI

struct ForecastListView: View {
    let viewModel: ForecastListViewModeling
    
    var body: some View {
        List(viewModel.forecasts) { forecast in
            ForecastView(forecast: forecast)
        }
    }
}
