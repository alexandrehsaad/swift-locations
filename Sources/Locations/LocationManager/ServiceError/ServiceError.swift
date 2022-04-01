// ServiceError.swift
// Motions
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of an service error.
public enum ServiceError: Int, Error {
	/// A service not authorized error.
	case notAuthorized = 0
	
	/// A service not available error.
	case notAvailable
	
	/// A service not changeable error.
	case notChangeable
	
	/// A service not entitled error.
	case notEntitled
	
	/// An unknown service error.
	case unknown
}
