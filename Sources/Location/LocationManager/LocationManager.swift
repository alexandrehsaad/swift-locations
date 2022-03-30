// LocationManager.swift
// Location
//
// Copyright © 2022 Alexandre H. Saad
//

#if !os(macOS) && canImport(CoreLocation)

import CoreLocation

/// A reprensentation of the location manager.
public final class LocationManager {
	
	// MARK: - Creating Instances
	
	/// Creates a new instance.
	private init() {}
	
	/// The underlying motion manager from Apple's CoreMotion framework.
	private let motionManager: CLLocationManager = .init()
	
	/// The shared instance.
	public static let shared: LocationManager = .init()
}

#endif
