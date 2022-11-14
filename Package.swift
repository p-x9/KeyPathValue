// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "KeyPathValue",
    products: [
        .library(
            name: "KeyPathValue",
            targets: ["KeyPathValue"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "KeyPathValue",
            dependencies: []
        ),
        .testTarget(
            name: "KeyPathValueTests",
            dependencies: ["KeyPathValue"]
        ),
    ]
)
