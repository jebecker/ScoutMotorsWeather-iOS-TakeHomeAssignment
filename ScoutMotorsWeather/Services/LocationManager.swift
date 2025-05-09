//
//  LocationManager.swift
//  ScoutMotorsWeather
//
//  Created by Jayme Becker on 5/9/25.
//

import Foundation
import CoreLocation

protocol LocationManaging {
    /// Async method to request a users location which throws on error
    /// - Returns: The users location as a CLLocationCoordinate2D object
    func requestLocation() async throws -> CLLocationCoordinate2D
}

/// Custom LocationManager class to handle requesting a users current location
class LocationManager: NSObject, LocationManaging{
    private var locationManager: CLLocationManager?
    private var locationContinuation: CheckedContinuation<CLLocationCoordinate2D, any Error>?
    
    override init() {
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    // Converts the call/response of CLLocationManager.requestLocation into an async method for easier use at
    // the call site
    // allows the call site to be try await locationManager.requestLocation
    func requestLocation() async throws -> CLLocationCoordinate2D {
        try await withCheckedThrowingContinuation { continuation in
            locationContinuation = continuation
            locationManager?.requestLocation()
        }
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
        
        locationContinuation?.resume(returning: location.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        locationContinuation?.resume(throwing: error)
    }
}
