// LocationManager.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
//

#if canImport(CoreLocation)

import CoreLocation

/// A reprensentation of the location manager.
@MainActor
@available(iOS 13, macOS 10.5, watchOS 6, *)
public final class LocationManager {
	
	// MARK: - Creating Instances
	
	/// Creates a new instance.
	public init() {
		self.locationManager.delegate = self.locationManagerDelegate
	}
	
	///
	///
	/// - parameter accuracy:
	public convenience init(accuracy: LocationAccuracy) {
		self.init()
		self.locationManager.desiredAccuracy = accuracy.clone
	}
	
	/// The underlying location manager from Apple's CoreLocation framework.
	private let locationManager: CLLocationManager = .init()
	
	/// The location manager delegate.
	private let locationManagerDelegate: LocationManagerDelegate = .init()
	
	/// The shared instance.
	public static let shared: LocationManager = .init()
	
	// MARK: - Sensors Availabilities
	
	/// A boolean value indicating whether the locater is available.
	public var isLocaterAvailable: Bool {
		return CLLocationManager.locationServicesEnabled()
	}
	
	// MARK: - Sensors Activities
	
	/// A boolean value indicating whether the licalizer is active.
	public var isLocaterActive: Bool {
		return CLLocationManager.locationServicesEnabled()
	}
	
	// MARK: - Requesting Authorizations
	
	///
	public var authorizationStatus: AuthorizationStatus {
		if #available(iOS 14, macOS 11, watchOS 7, *) {
			return self.locationManager.authorizationStatus.clone
		} else {
			return CLLocationManager.authorizationStatus().clone
		}
	}
	
	/// A boolean value indicating whether the user has authorized to be recorded.
	public var isRecordingAuthorized: Bool {
		return self.authorizationStatus.isAuthorized
	}
	
	///
	///
	/// - Returns:
	@discardableResult
	public func requestWhenInUseAuthorization() async -> AuthorizationStatus {
		return await withCheckedContinuation { (continuation) in
			guard self.isRecordingAuthorized == false else {
				continuation.resume(returning: self.authorizationStatus)
				return
			}
			
			self.locationManager.requestWhenInUseAuthorization()
			self.locationManagerDelegate.authorizationContinuation = continuation
		}
	}
	
	///
	///
	/// - Returns:
	@discardableResult
	public func requestAlwaysAuthorization() async -> AuthorizationStatus {
		return await withCheckedContinuation { (continuation) in
			guard self.isRecordingAuthorized == false else {
				continuation.resume(returning: self.authorizationStatus)
				return
			}
			
			self.locationManager.requestAlwaysAuthorization()
			self.locationManagerDelegate.authorizationContinuation = continuation
		}
	}
	
	// MARK: - Subscribing to Sensors
	
	/// Subscribes to the locater.
	///
	/// - Returns: An asynchronous stream of data from the locater.
	/// - Throws: A location reader error.
	public func subscribeToLocater() throws -> AsyncStream<CLLocation> {
//		guard self.isLocaterAvailable else {
//			throw
//		}
		
		return AsyncStream { (continuation) in
			self.locationManager.startUpdatingLocation()
			
			for location in self.locationManagerDelegate.locations {
				continuation.yield(location)
			}
		}
	}
	
	// MARK: - Unsubscribing from Sensors
	
	/// Unsubscribes from the locater.
	///
	/// - Throws: A location reader error.
	public func unsubscribeFromLocater() {
		self.locationManager.stopUpdatingLocation()
	}
}

#endif
