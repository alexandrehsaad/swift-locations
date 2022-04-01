// LocationManagerDelegate.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if canImport(CoreLocation)

import CoreLocation

@available(iOS 13, macCatalyst 15, macOS 10.5, watchOS 6, *)
final class LocationManagerDelegate: NSObject {
	var authorizationContinuation: CheckedContinuation<AuthorizationStatus, Never>? = nil
	
	var locatorUpdates: ([CLLocation]?, Error?) -> Void = { (_,_) in
		return
	}
}

@available(iOS 13, macCatalyst 15, macOS 10.5, watchOS 6, *)
extension LocationManagerDelegate: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		self.locatorUpdates(nil, error)
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		self.locatorUpdates(locations, nil)
	}
	
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		let status: CLAuthorizationStatus = manager.authStatus
		
		self.authorizationContinuation?.resume(returning: status.clone)
	}
}

#endif
