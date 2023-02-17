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
            url: "https://github.com/IMGARENA/front-row-seat-ios-cocoapod/releases/download/v0.7/IMGA.xcframework.zip",
            checksum: "ee1d0d2ac8188739aff8abcf46177415bfdaf925da7b6d4448ed4affb2e383e4"
        )
    ]
)
