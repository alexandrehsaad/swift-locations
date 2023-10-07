// LocationManagerDelegate.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if canImport(CoreLocation)

import CoreLocation

@available(iOS 13, macCatalyst 15, macOS 10.5, watchOS 6, *)
internal final class LocationManagerDelegate: NSObject {
	internal var authorizationContinuation: CheckedContinuation<AuthorizationStatus, Never>? = nil
	
	internal var locatorUpdates: ([CLLocation]?, Error?) -> Void = { (_,_) in
		return
	}
}

@available(iOS 13, macCatalyst 15, macOS 10.5, watchOS 6, *)
extension LocationManagerDelegate: CLLocationManagerDelegate {
	internal func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		self.locatorUpdates(nil, error)
	}
	
	internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		self.locatorUpdates(locations, nil)
	}
	
	internal func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		let status: AuthorizationStatus = .init(manager.authStatus)
		
		self.authorizationContinuation?.resume(returning: status)
		self.authorizationContinuation = nil
	}
}

#endif
