// LocationAccuracy.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
//

///
public enum LocationAccuracy {
	/// Best accuracy for navigation.
	case bestForNavigation
	
	/// Best accuracy.
	case best
	
	/// Accurate to ten metres
	case tenMetres
	
	/// Accurate to one hundred metres.
	case hundredMetres
	
	/// Accurate to one kilometre.
	case oneKilometre
	
	/// Accurate to three kilometres.
	case threeKilometers
}

#if canImport(CoreLocation)

import CoreLocation

extension LocationAccuracy {
	///
	internal var clone: CLLocationAccuracy {
		switch self {
		case .bestForNavigation:
			return CoreLocation.kCLLocationAccuracyBestForNavigation
		case .best:
			return CoreLocation.kCLLocationAccuracyBest
		case .tenMetres:
			return CoreLocation.kCLLocationAccuracyNearestTenMeters
		case .hundredMetres:
			return CoreLocation.kCLLocationAccuracyHundredMeters
		case .oneKilometre:
			return CoreLocation.kCLLocationAccuracyKilometer
		case .threeKilometers:
			return CoreLocation.kCLLocationAccuracyThreeKilometers
		}
	}
}

#endif
