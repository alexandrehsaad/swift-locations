// CLAuthorizationStatus+.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if canImport(CoreLocation)

import CoreLocation

extension CLAuthorizationStatus {
	internal var clone: AuthorizationStatus {
		switch self {
		case .notDetermined:
			return .undetermined
		case .restricted:
			return .restricted
		case .denied:
			return .denied
		case .authorizedWhenInUse:
			return .authorized(.whenInUse)
		case .authorizedAlways:
			return .authorized(.always)
		@unknown default:
			fatalError()
		}
	}
}

#endif
