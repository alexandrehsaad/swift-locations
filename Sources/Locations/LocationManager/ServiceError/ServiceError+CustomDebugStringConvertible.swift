// ServiceError+CustomDebugStringConvertible.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension ServiceError: CustomDebugStringConvertible {
	public var debugDescription: String {
		switch self {
		case .notAuthorized:
			return "The app is not authorized to use this service."
		case .notAvailable:
			return "The device does not support this service."
		case .notChangeable:
			return "The app can not ask to change authorization for this service."
		case .notEntitled:
			return "The app is missing an entitlement for this service."
		case .unknown:
			return "An unknown service error occurred."
		}
	}
}
