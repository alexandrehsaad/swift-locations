// AuthorizationStatus.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
//

/// A representation of a location manager authorization status.
public enum AuthorizationStatus {
	/// The status has not yet been determined.
	case undetermined
	
	/// Access is denied and restricted by the device.
	case restricted
	
	/// Access is denied by the user.
	case denied
	
	/// Access is authorized when in use by the user.
	case authorizedWhenInUse
	
	/// Access is authorized by the user.
	case authorizedAlways
	
	/// A boolean value indicating whether access is authorized by the user.
	public var isAuthorized: Bool {
		switch self {
		case .authorizedWhenInUse, .authorizedAlways:
			return true
		default:
			return false
		}
	}
}

#if canImport(CoreLocation)

import CoreLocation

extension CLAuthorizationStatus {
	///
	internal var clone: AuthorizationStatus {
		switch self {
		case .notDetermined:
			return .undetermined
		case .restricted:
			return .restricted
		case .denied:
			return .denied
		case .authorizedWhenInUse:
			return .authorizedWhenInUse
		case .authorizedAlways:
			return .authorizedAlways
		@unknown default:
			fatalError()
		}
	}
}

#endif
