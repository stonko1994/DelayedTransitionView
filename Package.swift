// swift-tools-version:5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DelayedTransitionView",
    platforms: [
        .iOS(.v14),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "DelayedTransitionView",
            targets: ["DelayedTransitionView"]
        ),
    ],
    targets: [
        .target(name: "DelayedTransitionView")
    ]
)
