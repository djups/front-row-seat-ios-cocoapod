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
            url: "https://github.com/IMGARENA/front-row-seat-ios-cocoapod/archive/refs/tags/v0.7.zip",
            checksum: "acc9e33aedc6cc84c4eaa17bf52c177401115bf5"
        )
    ]
)
