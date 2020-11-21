// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewMovement",
    defaultLocalization: "es",
    platforms: [
        .iOS(.v14),
        .tvOS(.v13),
        .macOS(.v10_15),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "NewMovement",
            targets: ["NewMovement"]
        )
    ],
    dependencies: [
        .package(path: "./NewMovement_iOS")

    ],
    targets: [
        .target(
            name: "NewMovement",
            dependencies: [
                .product(
                    name: "NewMovement_iOS",
                    package: "NewMovement_iOS",
                    condition: .when(platforms: [.iOS])
                )
            ]
        )
    ]
)
