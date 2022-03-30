// swift-tools-version:5.6

import PackageDescription

let package = Package(
	name: "swift-location",
	defaultLocalization: "en",
	products: [
		.library(name: "Location", targets: ["Location"])
	], dependencies: [
		.package(url: "https://github.com/alexandrehsaad/swift-extensions", branch: "main")
	], targets: [
		.target(name: "Location", dependencies: [
			.product(name: "Extensions", package: "swift-extensions"),
		]),
	], swiftLanguageVersions: [.v5]
)
