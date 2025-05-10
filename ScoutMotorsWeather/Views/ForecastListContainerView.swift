//
//  ForecastListContainerView.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import SwiftUI

struct ForecastListContainerView: View {
    @State var initialState: LoadingState = .loading
    let viewModel: ForecastListViewModeling
    
    var body: some View {
        NavigationStack {
            if initialState == .loading {
                ProgressView("Loading 7 Day Forecast")
                    .navigationTitle("7 Day Forecast")
            } else {
                if viewModel.forecasts.isEmpty {
                    EmptyForecastView()
                        .navigationTitle("7 Day Forecast")
                } else {
                    Text("We have data")
                        .navigationTitle("7 Day Forecast")
                }
            }
        }
        .task {
            await viewModel.fetchSevenDayForecast()
            initialState = .loaded
        }
    }
}
