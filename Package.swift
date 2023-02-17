// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IMGA",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        .library(
            name: "IMGA",
            targets: ["IMGA"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "IMGA",
url: "https://github.com/IMGARENA/front-row-seat-ios-cocoapod/releases/download/v0.8/IMGA.xcframework.zip",
checksum: "8124230d09f6ba91e894c2f5bc823b81808d0a8b89a99d5ae3e41f7931b01c88"
        )
    ]
)
