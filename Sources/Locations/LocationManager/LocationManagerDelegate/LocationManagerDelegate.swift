// LocationManagerDelegate.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
//

#if canImport(CoreLocation)

import CoreLocation

///
@available(iOS 13, macOS 10.5, watchOS 6, *)
final class LocationManagerDelegate: NSObject {
	
	// MARK: -
	
	///
	typealias AuthorizationContinuation = CheckedContinuation<AuthorizationStatus, Never>
	
	///
	typealias LocationContinuation = CheckedContinuation<[CLLocation], Error>
	
	// MARK: -
	
	///
	override init() {
		super.init()
	}
	
	// MARK: -
	
	///
	var authorizationContinuation: AuthorizationContinuation? = nil
	
	///
	var locations: Array<CLLocation> = []
	
	///
	var locationContinuation: LocationContinuation? = nil
}

@available(iOS 13, macOS 10.5, watchOS 6, *)
extension LocationManagerDelegate: CLLocationManagerDelegate {
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//		self.locationContinuation?.resume(throwing: error)
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		self.locations = locations
//		self.locationContinuation?.resume(returning: locations)
	}
	
	func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
		let status: CLAuthorizationStatus
		
		if #available(iOS 14, macOS 11, watchOS 7, *) {
			status = manager.authorizationStatus
		} else {
			status = CLLocationManager.authorizationStatus()
		}
		self.authorizationContinuation?.resume(returning: status.clone)
	}
}

#endif
