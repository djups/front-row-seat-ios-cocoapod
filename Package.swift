// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IMGA",
    platforms: [
        .iOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "IMGA",
            targets: ["IMGA"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "IMGA",
            url: "https://github.com/IMGARENA/front-row-seat-ios-cocoapod/releases/download/v0.7/IMGA.xcframework.zip",
            checksum: "a163a91142019206135ae0d393fb3bbe7d63127be2ae40ddbf8baa20349c2d05"
        )
    ]
)
