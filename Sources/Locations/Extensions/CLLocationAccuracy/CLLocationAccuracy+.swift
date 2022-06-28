// CLLocationAccuracy+.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if canImport(CoreLocation)

import CoreLocation

extension CLLocationAccuracy {
	/// Creates a new instance with the specified location accuracy.
	///
	/// - parameter accuracy: The location accuracy.
	internal init(_ accuracy: LocationAccuracy) {
		switch accuracy {
		case .bestForNavigation:
			self = CoreLocation.kCLLocationAccuracyBestForNavigation
		case .best:
			self = CoreLocation.kCLLocationAccuracyBest
		case .tenMetres:
			self = CoreLocation.kCLLocationAccuracyNearestTenMeters
		case .hundredMetres:
			self = CoreLocation.kCLLocationAccuracyHundredMeters
		case .oneKilometre:
			self = CoreLocation.kCLLocationAccuracyKilometer
		case .threeKilometers:
			self = CoreLocation.kCLLocationAccuracyThreeKilometers
		}
	}
}

#endif
