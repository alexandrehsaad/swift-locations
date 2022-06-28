// swift-tools-version:5.6

import PackageDescription

let package: Package = .init(
	name: "swift-locations",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v13),
		.macCatalyst(.v15),
		.macOS(.v10_15),
		.watchOS(.v6)
	],
	products: [
		.library(name: "Locations", targets: ["Locations"])
	],
	dependencies: [
		.package(url: "https://github.com/alexandrehsaad/swift-points.git", branch: "main"),
		.package(url: "https://github.com/apple/swift-docc-plugin.git", .upToNextMinor(from: "1.0.0"))
	],
	targets: [
		.target(
			name: "Locations",
			dependencies: [
				.product(name: "Points", package: "swift-points")
			],
			path: "Sources"
		),
	],
	swiftLanguageVersions: [.v5]
)
