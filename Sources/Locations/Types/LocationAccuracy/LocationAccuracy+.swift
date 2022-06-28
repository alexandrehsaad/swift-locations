// LocationAccuracy+.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if canImport(CoreLocation)

import CoreLocation

extension LocationAccuracy {
	/// Creates a new instance with the specified location accuracy.
	///
	/// - parameter accuracy: The location accuracy.
	internal init(_ accuracy: CLLocationAccuracy) {
		switch accuracy {
		case CoreLocation.kCLLocationAccuracyBestForNavigation:
			self = .bestForNavigation
		case CoreLocation.kCLLocationAccuracyBest:
			self = .best
		case CoreLocation.kCLLocationAccuracyNearestTenMeters:
			self = .tenMetres
		case CoreLocation.kCLLocationAccuracyHundredMeters:
			self = .hundredMetres
		case CoreLocation.kCLLocationAccuracyKilometer:
			self = .oneKilometre
		case CoreLocation.kCLLocationAccuracyThreeKilometers:
			self = .threeKilometers
		default:
			fatalError()
		}
	}
}

#endif
