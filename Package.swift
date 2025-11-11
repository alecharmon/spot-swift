// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SpotSwift",
    platforms: [
        .iOS(.v15),
        .macOS(.v12),
        .tvOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "SpotSwift",
            targets: ["SpotSwift"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SpotSwift",
            path: "Sources"
        ),
        .testTarget(
            name: "SpotSwiftTests",
            dependencies: ["SpotSwift"],
            path: "Tests"
        )
    ]
)
