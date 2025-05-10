//
//  LocationManager.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation
import CoreLocation

@MainActor
protocol LocationManaging {
    /// Async method to request a users location which throws on error
    /// - Returns: The users location as a CLLocationCoordinate2D object
    func requestLocation() async throws -> CLLocationCoordinate2D
    
    /// Async method to request a users location services use authorization if needed
    func requestAuthorizationIfNeeded() async
}

/// Custom LocationManager class to handle requesting a users current location
/// Since CLLocationManager is still non-sendable under the hood
/// and in order to make it a Sendable type, it has to be marked as @MainActor
/// This also causes us to mark the delegate methods as 'nonisolated' and wrap the code inside with MainActor.assumeIsolated
@MainActor
class LocationManager: NSObject, LocationManaging {
    private var locationManager: CLLocationManager?
    private var locationContinuation: CheckedContinuation<CLLocationCoordinate2D, any Error>?
    private var authorizationContinuation: CheckedContinuation<Void, Never>?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    // Converts the call/response of CLLocationManager.requestLocation into an async method for easier use at
    // the call site. This method uses CheckedContinuation in order to simulate a true async call instead of having to use
    // completion handlers
    // allows the call site to be try await locationManager.requestLocation
    func requestLocation() async throws -> CLLocationCoordinate2D {
        try await withCheckedThrowingContinuation { continuation in
            locationContinuation = continuation
            locationManager?.requestLocation()
        }
    }
    
    // Converts the call/response of CLLocationManager.requestWhenInUseAuthorization into an async method for easier use at
    // the call site. This method uses CheckedContinuation in order to simulate a true async call instead of having to use
    // completion handlers
    // Allows the call site to be try await locationManager.requestAuthorization
    func requestAuthorizationIfNeeded() async {
        await withCheckedContinuation { continuation in
            authorizationContinuation = continuation
            // only call requestWhenInUseAuthorization if the current status is .notDetermined (i.e. the user has not been asked yet),
            // otherwise resume the authorizationContinuation immediately
            if locationManager?.authorizationStatus == .notDetermined {
                locationManager?.requestWhenInUseAuthorization()
            } else {
                authorizationContinuation?.resume()
            }
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    nonisolated func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        MainActor.assumeIsolated {
            guard let location = locations.first else {
                return
            }
            
            // resume the locationContinuation since we now have location data
            locationContinuation?.resume(returning: location.coordinate)
        }
    }
    
    nonisolated func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        MainActor.assumeIsolated {
            // resume the locationContinuation with a thrown error
            locationContinuation?.resume(throwing: error)
        }
    }
    
    nonisolated func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        MainActor.assumeIsolated {
            // resume the authorizationContinuation if the users authorizationStatus has changed
            authorizationContinuation?.resume()
        }
    }
}
