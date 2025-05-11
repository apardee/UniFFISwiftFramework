// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UniFFISwiftFramework",
    targets: [
		.target(
			name: "UniFFISwiftFramework",
			dependencies: [ "uniffi_swift_frameworkFFI" ],
			path: "framework/Sources"),
		.binaryTarget(
			name: "uniffi_swift_frameworkFFI",
			path: "framework/uniffi_swift_frameworkFFI.xcframework"),
    ]
)
