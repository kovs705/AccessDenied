// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AccessDenied",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AccessDenied",
            targets: ["AccessDenied"]),
    ],
    targets: [
        .target(
            name: "AccessDenied"),
    ]
)
