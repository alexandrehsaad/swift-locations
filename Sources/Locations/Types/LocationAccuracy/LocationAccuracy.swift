// LocationAccuracy.swift
// Locations
//
// Copyright © 2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of a location accuracy.
public enum LocationAccuracy {
	/// Best accuracy for navigation.
	case bestForNavigation
	
	/// Best accuracy.
	case best
	
	/// Accurate to ten metres
	case tenMetres
	
	/// Accurate to one hundred metres.
	case hundredMetres
	
	/// Accurate to one kilometre.
	case oneKilometre
	
	/// Accurate to three kilometres.
	case threeKilometers
}
