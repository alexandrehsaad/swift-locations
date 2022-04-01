// LocationManager.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if canImport(CoreLocation)

import CoreLocation

/// A representation of the location manager.
@available(iOS 13, macCatalyst 15, macOS 10.5, watchOS 6, *)
public final class LocationManager {
	/// The underlying location manager from Apple's CoreLocation framework.
	private let locationManager: CLLocationManager = .init()
	
	/// The location manager delegate.
	private let locationManagerDelegate: LocationManagerDelegate = .init()
	
	// MARK: - Creating Instances
	
	/// Creates a new instance.
	public init() {
		self.locationManager.delegate = self.locationManagerDelegate
	}
	
	/// Creates a new instance with the desired location accuracy.
	///
	/// - parameter accuracy: The desired accuracy.
	public convenience init(accuracy: LocationAccuracy) {
		self.init()
		self.locationManager.desiredAccuracy = accuracy.clone
	}
	
	deinit {
		self.unsubscribeFromLocater()
	}
	
	// MARK: - Checking Availabilities
	
	/// A boolean value indicating whether the locater is available.
	public var isLocaterAvailable: Bool {
		return CLLocationManager.locationServicesEnabled()
	}
	
	// MARK: - Requesting Authorizations
	
	/// The app’s authorization status for using location services.
	public var authorizationStatus: AuthorizationStatus {
		return self.locationManager.authStatus.clone
	}
	
	/// A boolean value indicating whether the user has authorized to share his location.
	public var isAuthorizedToLocate: Bool {
		return self.authorizationStatus.isAuthorized
	}
	
	/// Requests the user’s permission to use location services while the app is in use.
	///
	/// - throws: An authorization not changeable error.
	/// - returns: A discardable authorization status.
	@discardableResult
	public func requestWhenInUseAuthorization() async throws -> AuthorizationStatus {
		guard self.authorizationStatus == .undetermined else {
			throw ServiceError.notChangeable
		}
		
		self.locationManager.requestWhenInUseAuthorization()
		
		return await withCheckedContinuation { (continuation) in
			self.locationManagerDelegate.authorizationContinuation = continuation
			
			if self.isAuthorizedToLocate {
				print("Location services were authorized.")
			}
		}
	}
	
	/// Requests the user’s permission to use location services regardless of whether the app is in use.
	///
	/// - throws: An authorization not changeable error.
	/// - returns: A discardable authorization status.
	@discardableResult
	public func requestAlwaysAuthorization() async throws -> AuthorizationStatus {
		guard self.authorizationStatus == .undetermined else {
			throw ServiceError.notChangeable
		}
		
		self.locationManager.requestAlwaysAuthorization()
		
		return await withCheckedContinuation { (continuation) in
			self.locationManagerDelegate.authorizationContinuation = continuation
			
			if self.isAuthorizedToLocate {
				print("Location services were authorized.")
			}
		}
	}
	
	// MARK: - Subscribing to Streams
	
	/// A boolean value indicating whether the locater is active.
	@available(*, unavailable)
	public var isLocaterActive: Bool {
		fatalError()
	}
	
	/// Subscribes to the locater.
	///
	/// - throws: A service not available error.
	/// - throws: A service not authorized error.
	/// - returns: An asynchronous stream of data from the locater.
	public func subscribeToLocater() throws -> AsyncStream<CLLocation> {
		guard self.isLocaterAvailable else {
			throw ServiceError.notAvailable
		}
		
		guard self.isAuthorizedToLocate else {
			throw ServiceError.notAuthorized
		}
		
		return AsyncStream { (continuation) in
			self.locationManagerDelegate.locatorUpdates = { (data, error) in
				// FIXME: better handle errors from the callback
				if let error = error {
					print(error.localizedDescription)
					continuation.finish()
					return
				}
				
				guard let locations: [CLLocation] = data else {
					continuation.finish()
					return
				}
				
				for location in locations {
					continuation.yield(location)
				}
			}
			
			self.locationManager.startUpdatingLocation()
			
			continuation.onTermination = { @Sendable (termination) in
				switch termination {
				case .cancelled:
					print("Locater stream was cancelled.")
				case .finished:
					print("Locater stream was finished.")
				@unknown default:
					fatalError()
				}
				
				self.locationManager.stopUpdatingLocation()
			}
		}
	}
	
	// MARK: - Unsubscribing from Streams
	
	/// Unsubscribes from the locater.
	public func unsubscribeFromLocater() {
		self.locationManager.stopUpdatingLocation()
	}
}

#endif
