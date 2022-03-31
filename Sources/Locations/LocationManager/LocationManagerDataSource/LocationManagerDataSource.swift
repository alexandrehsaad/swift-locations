// LocationManagerDataSource.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
//

/// A representation of a motion manager data source.
public enum LocationManagerDataSource: Codable {
	/// Recordings from a simulator.
	case simulator
	
	/// Recordings from a device.
	case device
	
	/// The current source.
	static var current: Self {
		#if targetEnvironment(simulator)
		return .simulator
		#else
		return .device
		#endif
	}
}
