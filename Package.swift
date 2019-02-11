// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "xcodeproj-modify",
    dependencies: [
        .package(url: "https://github.com/tuist/xcodeproj.git", from: "6.2.0"),
    ],
    targets: [
        .target(
            name: "xcodeproj-modify",
            dependencies: ["xcodeproj"]),
        .testTarget(
            name: "xcodeproj-modifyTests",
            dependencies: ["xcodeproj-modify"]),
    ]
)
