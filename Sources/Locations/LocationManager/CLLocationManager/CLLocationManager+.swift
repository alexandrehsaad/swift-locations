// CLLocationManager+.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

#if canImport(CoreLocation)

import CoreLocation

extension CLLocationManager {
	var authStatus: CLAuthorizationStatus {
		if #available(iOS 14, macOS 11, watchOS 7, *) {
			return self.authorizationStatus
		} else {
			return Self.authorizationStatus()
		}
	}
}

#endif
