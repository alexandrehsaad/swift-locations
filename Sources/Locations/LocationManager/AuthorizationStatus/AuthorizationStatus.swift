// AuthorizationStatus.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of an authorization status.
@frozen
public enum AuthorizationStatus: Equatable {
	/// The status has not yet been determined.
	case undetermined
	
	/// Access is denied and restricted by the device.
	case restricted
	
	/// Access is denied by the user.
	case denied
	
	/// Access is authorized by the user.
	case authorized(AuthorizedOptions)
	
	/// A boolean value indicating whether access is authorized by the user.
	public var isAuthorized: Bool {
		switch self {
		case .authorized:
			return true
		default:
			return false
		}
	}
	
	/// A representation of an authorization status.
	public enum AuthorizedOptions {
		/// Access is authorized by the user while the app is in use.
		case whenInUse
		
		/// Access is authorized by the user regardless of whether the app is in use.
		case always
	}
}
