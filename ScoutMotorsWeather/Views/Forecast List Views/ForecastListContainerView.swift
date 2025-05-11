//
//  ForecastListContainerView.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import SwiftUI

/// Container view to help display a ForecastListView with loading state
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
                    ForecastListView(viewModel: viewModel)
                        .navigationTitle("7 Day Forecast")
                }
            }
        }
        .task {
            // Due to the nature of how this app is architected, only making an API call in this .task block ensures that
            // we will only ever make one API call so that the API rate limit is not a concern.
            // If I were to add additional features to this assignment, I could add pull to refresh using the
            // .refreshable modifier and limit the amount of times you can refresh the data by persisting the last time
            // the data was pulled and only allow a "refresh" after a certain amount of time has passed
            await viewModel.fetchSevenDayForecast()
            initialState = .loaded
        }
    }
}
