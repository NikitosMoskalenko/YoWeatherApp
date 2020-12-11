//
//  LocationManager.swift
//  YoWeather
//
//  Created by Nikita Moskalenko on 12/1/20.
//

import Foundation
import CoreLocation


final class LocationManager: NSObject {
    
    static let shared = LocationManager()
    var location = CLLocation()
    let locationManager = CLLocationManager()
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkAuthorisationStatus()
            NotificationCenter.default.post(name: .getLocation, object: nil)
            getLocation()
        } else {
            
        }
    }
    
    private func checkAuthorisationStatus() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            getLocation()
        case .authorizedWhenInUse:
            getLocation()
        case .denied:
            break // Alert
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break // Alert
        @unknown default:
            fatalError("Fatal Error")
        }
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
    }
    
    private func getLocation() {
        guard let currentLocation = locationManager.location else {
            print("Location is eneble")
            return
        }
        location = currentLocation
        
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) { }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
       
    }
}
