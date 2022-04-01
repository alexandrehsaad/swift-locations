// swift-tools-version:5.6

import PackageDescription

let package = Package(
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
		.package(url: "https://github.com/alexandrehsaad/swift-extensions", branch: "main")
	],
	targets: [
		.target(name: "Locations", dependencies: [
			.product(name: "Extensions", package: "swift-extensions"),
		]),
	],
	swiftLanguageVersions: [.v5]
)
