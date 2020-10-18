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
            name: "NewMovement_iOS",
            targets: ["NewMovement_iOS"]
        ),
    ],
    dependencies: [
        .package(name: "DataManagement",
                 url: "https://github.com/bastianX6/accounts-data-management.git",
                 from: "1.0.2"),
        .package(name: "AccountsUI",
                 url: "https://github.com/bastianX6/accounts-ui.git",
                 from: "1.1.0"),
        .package(name: "DependencyResolver",
                 url: "https://github.com/bastianX6/accounts-dependency-resolver",
                 from: "0.1.0"),

    ],
    targets: [
        .target(
            name: "NewMovementCommon",
            dependencies: [
                "AccountsUI",
                "DependencyResolver",
            ],
            resources: [.process("Resources")]
        ),
        .target(
            name: "NewMovement_iOS",
            dependencies: [
                "DataManagement",
                "AccountsUI",
                "NewMovementCommon",
                "DependencyResolver"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "NewMovementTests",
            dependencies: ["NewMovementCommon"]
        )
    ]
)
