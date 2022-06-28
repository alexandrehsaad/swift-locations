// AuthorizationStatus+.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if canImport(CoreLocation)

import CoreLocation

extension AuthorizationStatus {
	/// Creates a new instance with the specified location accuracy.
	///
	/// - parameter status: The authorization status.
	internal init(_ status: CLAuthorizationStatus) {
		switch status {
		case .notDetermined:
			self = .undetermined
		case .restricted:
			self = .restricted
		case .denied:
			self = .denied
		case .authorizedWhenInUse:
			self = .authorized(.whenInUse)
		case .authorizedAlways:
			self = .authorized(.always)
		@unknown default:
			fatalError()
		}
	}
}

#endif
