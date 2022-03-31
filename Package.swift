// swift-tools-version:5.6

import PackageDescription

let package = Package(
	name: "swift-locations",
	defaultLocalization: "en",
	platforms: [
		.iOS(.v9),
		.macCatalyst(.v13),
		.macOS(.v11),
		.watchOS(.v2)
	],
	products: [
		.library(name: "Locations", targets: ["Locations"])
	],
	dependencies: [
		.package(url: "https://github.com/alexandrehsaad/swift-extensions", branch: "main")
	],
	targets: [
		.target(name: "Locations", dependencies: [
			.product(name: "Extensions", package: "swift-extensions"),
		]),
	],
	swiftLanguageVersions: [.v5]
)
